; MovingData.nasm
; Author: HotPlugin


global _start

section .text
_start:
	; Move immediate data to register
	mov eax, 0xaaaaaaaa
	mov al, 0xbb
	mov ah, 0xcc
	mov ax, 0xdddd

	mov ebx, 0
	mov ecx, 0

	; Move register to register
	mov ebx, eax
	mov cl, al
	mov ch, ah
	mov cx, ax

	mov eax, 0
	mov ebx, 0
	mov ecx, 0

	;Mov from memory to register
	mov al, [sample]
	mov ah, [sample+1]
	mov bx, [sample]
	mov ecx, [sample]

	; Mov from register into memory
	mov eax, 0x33445566
	mov byte [sample], al
	mov word [sample], ax
	mov dword[sample], eax

	; Mov immediate values into memory
	mov dword [sample], 0x33445566

	; lea demo
	lea eax, [sample]
	lea ebx, [eax]

	xchg eax, ebx

	; exit program
	mov eax, 1
	mov ebx, 0
	int 0x80

section .data
	sample: db 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff, 0x11, 0x22
