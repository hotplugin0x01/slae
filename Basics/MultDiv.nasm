; MultDiv.nasm
; Author: HotPlugin

global _start

section .text
_start:
	; Unsigned r/m8 multplication
	mov eax, 0x0
	
	mov al, 0x10
	mov bl, 0x2
	mul bl

	mov al, 0xFF
	mul bl

	; Unsigned r/m16 multiplication
	mov eax, 0x0
	mov ebx, 0x0

	mov ax, 0x1122
	mov bx, 0x0002
	mul bx

	mov ax, 0x1122
	mov bx, 0x1122
	mul bx

	; Unsigned r/m32 multiplication
	mov eax, 0x11223344
	mov ebx, 0x00000002
	mul ebx

	mov eax, 0x11223344
	mov ebx, 0x55667788
	mul ebx

	; Multiplcation using memory locations
	mul byte [var1]
	mul word [var2]
	mul dword [var3]

	; Division using r/m16
	mov dx, 0x0
	mov ax, 0x7788
	mov cx, 0x2
	div cx

	mov ax, 0x7788 + 0x1
	mov cx, 0x2
	div cx

	; Exit program
	mov eax, 0x1
	mov ebx, 0x0
	int 0x80


section .data
	var1 db 0x05
	var2 dw 0x1122
	var3 dd 0x11223344
