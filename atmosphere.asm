; This program indicates the layer of the
; atmosphere corresponding to an altitude.

global _start

section .bss
	altitude resw 1

section .data
	ALTITUDE_MSG db "Altitude (km): "
	ALTITUDE_MSG_LENGTH equ $-ALTITUDE_MSG

	NO_ERROR equ 0

	STDIN equ 0
	STDOUT equ 1

	SYSCALL_EXIT equ 1
	SYSCALL_READ equ 3
	SYSCALL_WRITE equ 4

	WORD_SIZE equ 2

section .text
_start:
	; Ask for the altitude.
	mov eax, SYSCALL_WRITE
	mov ebx, STDOUT
	mov ecx, ALTITUDE_MSG
	mov edx, ALTITUDE_MSG_LENGTH
	int 0x80

	; Read the altitude
	mov eax, SYSCALL_READ
	mov ebx, STDIN
	mov ecx, altitude
	mov edx, WORD_SIZE
	int 0x80

	; Display the altitude
	mov eax, SYSCALL_WRITE
	mov ebx, STDOUT
	mov ecx, altitude
	mov edx, WORD_SIZE
	int 0x80

	; Altitude invalid if < 0.

	; Exit
	mov eax, SYSCALL_EXIT
	mov ebx, NO_ERROR
	int 0x80
