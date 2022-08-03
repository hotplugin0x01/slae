; HelloWorld.asm
; Author: HotPlugin


global _start			; Define program entry point

section .text			; Define code/text section

_start:
	; Write hello world on screen
	mov eax, 0x4		; Move write syscall number in eax
	mov ebx, 0x1		; Move file descriptor (stdout) into ebx
	mov ecx, message	; Move message to print in ebx
	mov edx, msglen		; Move message length in ecx
	int 0x80		; issue interrupt

	; Exit
	mov eax, 0x1		; Move exit sys call number in eax
	mov ebx, 0x5    	; Move exit status 5 in ebx
	int 0x80		; issue interrupt


section .data			; Define data section

	message: db "Hello World!"	; Define message labe with string
	msglen	equ $-message		; Calculate message string length
