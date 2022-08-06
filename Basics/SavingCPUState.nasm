; SavingCPUState.nasm
; Author: HotPlugin

global _start

section .text

HelloWorldProc:

	; Function prologue
	push ebp
	mov ebp, esp


	; Print hello world using write sys call
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, message
	mov edx, mlen
	int 0x80
	
	; Function epilogue
	; mov esp, ebp
	; pop ebp

	leave	; This is equivalent to above epilogue

	ret	; End of proc


_start:
	mov ecx, 0x10


PrintHelloWorld:
	
	; Preserve Registers and Flags in stack
	pushad
	pushfd	

	call HelloWorldProc	; Calling proc

	; Restoring registers and flags back from stack
	popfd
	popad

	loop PrintHelloWorld

	; Exit program
	mov eax, 0x1
	mov ebx, 0x0
	int 0x80


section .data
	message: db "Hello World"
	mlen equ $-message
