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

mkdir -p src obj bin results 

cat <<EOL > src/main.c
#include <stdio.h>
#include <omp.h>

int main() {
    return 0;
}
EOL

printf "CC=gcc\nCFLAGS=-I. -fopenmp\n\nall: bin/main\n\nbin/main: obj/main.o\n\t\$(CC) -o bin/main obj/main.o \$(CFLAGS)\n\nobj/main.o: src/main.c\n\t\$(CC) -c src/main.c -o obj/main.o \$(CFLAGS)\n\nclean:\n\trm -f obj/*.o bin/main\n" > Makefile

printf "#!/bin/bash\n\n#PBS -N myJob\n#PBS -q studenti\n#PBS -o results/result.out\n#PBS -e results/result.err\n\ncd \$PBS_O_WORKDIR\n\nif [ -f results/result.out ]; then\n    rm results/result.out\nfi\n\nif [ -f results/result.err ]; then\n    rm reusults/result.err\nfi\n\necho 'Working directory: ' \$(pwd)\n\nmake\n\n./bin/main" > $1.pbs

echo "Started C developing."
