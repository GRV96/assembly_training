global _start

section .bss
	a_char resb 1

section .data
	INPUT_MSG db "Enter a character: "
	IN_MSG_LENGTH equ $-INPUT_MSG

	OUTPUT_MSG db "You have entered "
	OUT_MSG_LENGTH equ $-OUTPUT_MSG
	OUT_MSG_END db ".", 0xA
	OUT_MSG_END_LENGTH equ $-OUT_MSG_END

section .text
_start:
	; Ask the user to enter a character.
	mov eax, 4
	mov ebx, 1
	mov ecx, INPUT_MSG
	mov edx, IN_MSG_LENGTH
	int 0x80

	; Read the character.
	mov eax, 3
	mov ebx, 2
	mov ecx, a_char
	mov edx, 1
	int 0x80

	; Tell the entered character.
	mov eax, 4
	mov ebx, 1
	mov ecx, OUTPUT_MSG
	mov edx, OUT_MSG_LENGTH
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, a_char
	mov edx, 1
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, OUT_MSG_END
	mov edx, OUT_MSG_END_LENGTH
	int 0x80

	; Exit
	mov eax, 1 ; Syscall 1: exit
	mov ebx, 0 ; Return value 0: no error
	int 0x80
