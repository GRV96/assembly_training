global _start

.data:
	INPUT_MSG db "Enter a character: "
	IN_MSG_LENGTH equ $-INPUT_MSG
	OUTPUT_MSG db "You have entered "
	OUT_MSG_LENGTH equ $-OUTPUT_MSG

.text:
_start:
	mov eax, 4             ; Syscall 4: write
	mov ebx, 1             ; Argument 1 int fd: file descriptor. 1 is stdout.
	mov ecx, INPUT_MSG     ; Argument 2 const char *buf: the string to write
	mov edx, IN_MSG_LENGTH ; Argument 3 size_t count: number of bytes in but
	int 0x80               ; int: interrupt. 0x80: run the syscall in eax.

	mov eax, 1 ; Syscall 1: exit
	mov ebx, 0 ; Return value 0: no error
	int 0x80
