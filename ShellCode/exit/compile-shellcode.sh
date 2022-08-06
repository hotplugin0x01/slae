#!/bin/bash

gcc -fno-stack-protector -z execstack -o $1 $1.c
