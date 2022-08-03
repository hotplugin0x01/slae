; Stack.nasm
; Author: HotPlugin

global _start

section .text
_start:
	mov eax, 0x66778899
	mov ebx, 0x0
	mov ecx, 0x0

	; Push and Pop of r/m16 and r/m32

	; Register push and pop
	push ax
	pop bx

	push eax
	pop ecx

	; Memory push and pop
	push word [sample]
	pop ecx

	push dword [sample]
	pop edx

	;exi program
	mov eax, 1
	mov ebx, 0
	int 0x80

section .data
	
	sample: db 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff
