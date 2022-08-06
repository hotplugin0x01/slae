#!/bin/bash

# Assemble the file
nasm -f elf32 -o $1.o $1.nasm

# Link the object file
ld -o $1 $1.o

# Extract the shell code
objdump -d $1 | grep -Po '\s\K[a-f0-9]{2}(?=\s)' | sed 's/^/\\x/g' | perl -pe 's/\r?\n//' | sed 's/$/\n/'
