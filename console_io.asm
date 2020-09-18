global _start

.data:
	INPUT_MSG db "Enter a character: "
	IN_MSG_LENGTH equ $-INPUT_MSG

	OUTPUT_MSG db 0xA, "You have entered "
	OUT_MSG_LENGTH equ $-OUTPUT_MSG

.text:
_start:
	; Ask the user to enter a character.
	mov eax, 4
	mov ebx, 1
	mov ecx, INPUT_MSG
	mov edx, IN_MSG_LENGTH
	int 0x80

	; Tells the entered character.
	mov eax, 4
	mov ebx, 1
	mov ecx, OUTPUT_MSG
	mov edx, OUT_MSG_LENGTH
	int 0x80

	; Exit
	mov eax, 1 ; Syscall 1: exit
	mov ebx, 0 ; Return value 0: no error
	int 0x80
