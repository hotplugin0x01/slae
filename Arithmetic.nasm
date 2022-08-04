; Arithmetic.nasm
; Author: HotPlugin

global _start

section .text
_start:
	; Register based addition
	mov eax, 0
	add al, 0x22
	add al, 0x11

	mov ax, 0x1122
	add ax, 0x3344

	mov eax, 0xffffffff
	add eax, 0x10

	; Memory based addition
	mov eax, 0
	add byte [var1], 0x22
	add byte [var1], 0x11

	add word [var2], 0x1122
	add word [var2], 0x3344

	mov dword [var3], 0xffffffff
	add dword [var3], 0x10


	; set / clear / complement the carry flag
	
	clc		; Clear the carry flag
	stc		; Set the carry flag
	cmc		; Complement the carry flag


	; Add with carry
	mov eax, 0
	stc
	adc al, 0x22
	stc
	adc al, 0x11

	mov ax, 0x1122
	stc
	adc ax, 0x3344

	mov eax, 0xffffffff
	stc
	adc eax, 0x10
	
	; Subtract
	mov eax, 0xA
	sub eax, 0x5
	stc
	sbb eax, 4

	; Increment / Decrement
	inc eax
	dec eax

	; Exit program
	mov eax, 0x1
	mov ebx, 0x0
	int 0x80

section .data
	var1 db 0x00
	var2 dw 0x0000
	var3 dd 0x00000000
