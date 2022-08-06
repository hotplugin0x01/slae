#!/bin/bash

# Compile given file in elf32 format
nasm -f elf32 -o $2.o $1

# Link object file into elf format
ld -o $2 $2.o
