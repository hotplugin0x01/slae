; File: Exit.nasm
; Author: HotPlugin


global _start

section .text
_start:

	; Exit sys call
	
	xor eax, eax	; For clearing remaing 24 unused bits and remove nulls
	mov al, 0x1
	xor ebx, ebx	; Same reason
	mov bl, 0xA
	int 0x80
