; Strings.nasm
; Author: HotPlugin

global _start

section .text
_start:
	
	; Copy string from src to dst
	mov ecx, srclen
	lea esi, [src]
	lea edi, [dst]

	cld	; Clear direction flag
	rep movsb

	; Print hello world
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, dst
	mov edx, srclen
	int 0x80

	; String comparision with cmpsb
	; Compare src and dst
	mov ecx, srclen
	lea esi, [src]
	lea edi, [dst]
	repe cmpsb

	jz SetEqual
	mov ecx, result2
	mov edx, result2len
	jmp Print

SetEqual:
	mov ecx, result1
	mov edx, result1len

Print:
	mov eax, 0x4
	mov ebx, 0x1
	int 0x80

	mov eax, 0x1
	mov ebx, 0x0
	int 0x80

section .data
	src: db "Hello World!", 0xA
	srclen equ $-src

	comparison: db "Hello"
	
	result1: db "Strings are Equal", 0xA
	result1len equ $-result1

	result2: db "Strings are not equal", 0xA
	result2len equ $-result2

section .bss
	dst: resb 100
