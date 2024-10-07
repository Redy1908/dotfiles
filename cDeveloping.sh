#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: Missing directory name."
  exit 1
fi

if [ -d "$1" ]; then
  echo "Error: The directory '$1' already exists."
  exit 1
fi

mkdir -p "$1"
cd "$1" || exit

mkdir -p src include bin lib obj results 

cat <<EOL > src/main.c
#include <stdio.h>
#include <omp.h>

int main() {
    return 0;
}
EOL

cat <<EOL > Makefile
CC = cc
CFLAGS = -Wall -Iinclude
LDFLAGS = -Llib

SRC = \$(wildcard src/*.c)
OBJ = \$(SRC:src/%.c=obj/%.o)
EXEC = bin/main

all: \$(EXEC)

\$(EXEC): \$(OBJ)
	\$(CC) \$(OBJ) -o \$(EXEC) \$(LDFLAGS)

obj/%.o: src/%.c
	\$(CC) \$(CFLAGS) -c \$< -o \$@

clean:
	rm -f obj/*.o \$(EXEC)

.PHONY: all clean
EOL

cat <<EOL > $1.pbs
#!/bin/bash

#PBS -N myJob
#PBS -q studenti
#PBS -o results/result.out
#PBS -e results/result.err

cd \$PBS_O_WORKDIR

if [ -f results/result.out ]; then
    rm results/result.out
fi

if [ -f results/result.err ]; then
    rm results/result.err
fi

make

./bin/main
EOL

cat <<EOL > compile_commands.json
[
  {
    "arguments": [
      "/usr/bin/cc",
      "-Wall",
      "-Iinclude",
      "-c",
      "-o",
      "obj/main.o",
      "src/main.c"
    ],
    "directory": "$1",
    "file": "$(pwd)/src/main.c",
    "output": "$(pwd)/obj/main.o"  
  }
]
EOL

echo "Started C developing."
