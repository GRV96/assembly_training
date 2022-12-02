; This program indicates the layer of the
; atmosphere corresponding to an altitude.

global _start

section .data
	NEG_ALT_ERR_MSG db "Error: altitude < 0 km", 0xA
	NEG_ALT_ERR_MSG_LENGTH equ $-NEG_ALT_ERR_MSG

	EXEC_END db "Execution ended.", 0xA
	EXEC_END_LENGTH equ $-EXEC_END

	NO_ERROR equ 0

	STDIN equ 0
	STDOUT equ 1

	SYSCALL_EXIT equ 1
	SYSCALL_READ equ 3
	SYSCALL_WRITE equ 4

	; Name and altitude of the atmosphere's layers
	TROPOSPHERE db "Troposphere", 0xA
	TROPOSPHERE_LENGTH equ $-TROPOSPHERE
	TROPOSPHERE_ALT equ 0

	STRATOSPHERE db "Stratosphere", 0xA
	STRATOSPHERE_LENGTH equ $-STRATOSPHERE
	STRATOSPHERE_ALT equ 12

	MESOSPHERE db "Mesosphere", 0xA
	MESOSPHERE_LENGTH equ $-MESOSPHERE
	MESOSPHERE_ALT equ 50

	THERMOSPHERE db "Thermosphere", 0xA
	THERMOSPHERE_LENGTH equ $-THERMOSPHERE
	THERMOSPHERE_ALT equ 85

	EXOSPHERE db "Exosphere", 0xA
	EXOSPHERE_LENGTH equ $-EXOSPHERE
	EXOSPHERE_ALT equ 500

section .text
_start:
	mov eax, 22 ; altitude (km)
	cmp eax, TROPOSPHERE_ALT
	jge troposphere

	; Altitude invalid if < 0.
	mov eax, SYSCALL_WRITE
	mov ebx, STDOUT
	mov ecx, NEG_ALT_ERR_MSG
	mov edx, NEG_ALT_ERR_MSG_LENGTH
	int 0x80
	jmp endif

troposphere:
	cmp eax, STRATOSPHERE_ALT
	jg stratosphere

	mov eax, SYSCALL_WRITE
	mov ebx, STDOUT
	mov ecx, TROPOSPHERE
	mov edx, TROPOSPHERE_LENGTH
	int 0x80
	jmp endif

stratosphere:
	cmp eax, MESOSPHERE_ALT
	jg mesosphere

	mov eax, SYSCALL_WRITE
	mov ebx, STDOUT
	mov ecx, STRATOSPHERE
	mov edx, STRATOSPHERE_LENGTH
	int 0x80
	jmp endif

mesosphere:
	cmp eax, THERMOSPHERE_ALT
	jg thermosphere

	mov eax, SYSCALL_WRITE
	mov ebx, STDOUT
	mov ecx, MESOSPHERE
	mov edx, MESOSPHERE_LENGTH
	int 0x80
	jmp endif

thermosphere:
	cmp eax, EXOSPHERE_ALT
	jg exosphere

	mov eax, SYSCALL_WRITE
	mov ebx, STDOUT
	mov ecx, THERMOSPHERE
	mov edx, THERMOSPHERE_LENGTH
	int 0x80
	jmp endif

exosphere:
	mov eax, SYSCALL_WRITE
	mov ebx, STDOUT
	mov ecx, EXOSPHERE
	mov edx, EXOSPHERE_LENGTH
	int 0x80

endif:
	mov eax, SYSCALL_WRITE
	mov ebx, STDOUT
	mov ecx, EXEC_END
	mov edx, EXEC_END_LENGTH
	int 0x80

	; Exit
	mov eax, SYSCALL_EXIT
	mov ebx, NO_ERROR
	int 0x80
