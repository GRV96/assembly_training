global _start

MAX_STR_LENGTH equ 32

section .bss
	a_str resb MAX_STR_LENGTH

section .data
	INPUT_MSG db "Enter a string: "
	IN_MSG_LENGTH equ $-INPUT_MSG

	OUTPUT_MSG db "You have entered "
	OUT_MSG_LENGTH equ $-OUTPUT_MSG

section .text
_start:
	; Ask the user to enter a string.
	mov eax, 4
	mov ebx, 1
	mov ecx, INPUT_MSG
	mov edx, IN_MSG_LENGTH
	int 0x80

	; Read the string.
	mov eax, 3
	mov ebx, 2
	mov ecx, a_str
	mov edx, MAX_STR_LENGTH
	int 0x80

	; Tell the entered character.
	mov eax, 4
	mov ebx, 1
	mov ecx, OUTPUT_MSG
	mov edx, OUT_MSG_LENGTH
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, a_str
	mov edx, MAX_STR_LENGTH
	int 0x80

	; Exit
	mov eax, 1 ; Syscall 1: exit
	mov ebx, 0 ; Return value 0: no error
	int 0x80
