; Based on a video tutorial by John Hammond
; https://www.youtube.com/watch?v=HgEGAaYdABA

global _start

section .text
_start:
	mov eax, 0x4        ; Syscall 4: write
	mov ebx, 1          ; Argument int fd: file descriptor. 1 is stdout.
	mov ecx, MESSAGE    ; Argument const void *buf: the string to write
	mov edx, MSG_LENGTH ; Argument size_t count: number of bytes in buf
	int 0x80            ; int: interrupt. 0x80: run the syscall in eax.

	mov eax, 0x1 ; Syscall 1: exit
	mov ebx, 0   ; Return value 0: no error
	int 0x80

section .data
	; db: define bytes
	; 0xA = 10 = '\n'
	MESSAGE: db "Hello, world!", 0xA

	; $: current location (address of MSG_LENGTH)
	; $-x: $ - address of varaible x
	; Result: number of bytes between $ and x = string's length
	; Works only immediately after the string's declaration
	; Explained in a comment by Patrick Sevallius.
	MSG_LENGTH: equ $-MESSAGE
