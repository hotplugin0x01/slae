; Procedure.nasm
; Author: HotPlugin

global _start

section .text

HelloWorldProc:

	; Print hello world using write sys call
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, message
	mov edx, mlen
	int 0x80
	ret	; End of proc


_start:
	mov ecx, 0x10


PrintHelloWorld:
	push ecx
	call HelloWorldProc	; Calling proc
	pop ecx
	loop PrintHelloWorld

	; Exit program
	mov eax, 0x1
	mov ebx, 0x0
	int 0x80


section .data
	message: db "Hello World"
	mlen equ $-message
