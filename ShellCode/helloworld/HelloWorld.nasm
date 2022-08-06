; HelloWorld.asm
; Author: HotPlugin


global _start

section .text

_start:

	jmp short call_shellcode


shellcode:
	
	; Write hello world on screen
	
	xor eax, eax
	mov al, 0x4

	xor ebx, ebx
	mov bl, 0x1
	
	pop ecx		; Dynamically loads message in ecx
	;mov ecx, message
	
	xor edx, edx
	mov dl, 0xd

	int 0x80

	; Exit sys call
	xor eax, eax
	mov al, 0x1
	
	xor ebx, ebx
	
	int 0x80


call_shellcode:

	call shellcode
	message: db "Hello World!", 0xA
