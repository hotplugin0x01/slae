; Libc.nasm
; Author: HotPlugin

extern printf
extern exit

global main

section .text
main:
	push message
	call printf
	add esp, 0x4	; Adjust the stack

	mov eax, 0xa
	call exit

section .data

	message: db "Hello World", 0xa, 0x00
