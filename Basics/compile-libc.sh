#!/bin/bash

# Assemble with  nasm
nasm -f elf32 -o $2.o $1

# Link using GCC
gcc -o $2 $2.o
