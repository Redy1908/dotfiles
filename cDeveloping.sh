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

mkdir -p src obj bin

cat <<EOL > src/main.c
#include <stdio.h>

int main() {
    return 0;
}
EOL

printf "CC=gcc\nCFLAGS=-I.\n\nall: bin/main\n\nbin/main: obj/main.o\n\t\$(CC) -o bin/main obj/main.o\n\nobj/main.o: src/main.c\n\t\$(CC) -c src/main.c -o obj/main.o\n\nclean:\n\trm -f obj/*.o bin/main\n" > Makefile

echo "Struttura della directory e Makefile creati con successo nella directory '$1'."

