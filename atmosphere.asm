; This program indicates the layer of the
; atmosphere corresponding to an altitude.

global _start

section .bss
	altitude resw 1

section .data
	ALT_VAR_SIZE equ 2

	ALTITUDE_MSG db "Altitude (km): "
	ALTITUDE_MSG_LENGTH equ $-ALTITUDE_MSG

	NEG_ALT_ERR_MSG db "Error: altitude < 0 km", 0xA
	NEG_ALT_ERR_MSG_LENGTH equ $-NEG_ALT_ERR_MSG

	NO_ERROR equ 0

	STDIN equ 0
	STDOUT equ 1

	SYSCALL_EXIT equ 1
	SYSCALL_READ equ 3
	SYSCALL_WRITE equ 4

	; Name and altitude of the atmosphere's layers
	TROPOSPHERE db "Troposphere", 0xA
	TROPOSPHERE_LENGTH equ $-TROPOSPHERE

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
	; Altitude (km)
	mov eax, 7

	; Comparison
	cmp eax, 0

	; Altitude invalid if < 0.
	jg troposphere
	mov eax, SYSCALL_WRITE
	mov ebx, STDOUT
	mov ecx, NEG_ALT_ERR_MSG
	mov edx, NEG_ALT_ERR_MSG_LENGTH
	int 0x80
	jmp endif

troposphere:
	mov eax, SYSCALL_WRITE
	mov ebx, STDOUT
	mov ecx, TROPOSPHERE
	mov edx, TROPOSPHERE_LENGTH
	int 0x80
	jmp endif

endif:
	; Display the altitude
	;mov eax, SYSCALL_WRITE
	;mov ebx, STDOUT
	;mov ecx, altitude
	;mov edx, ALT_VAR_SIZE
	;int 0x80

	; Exit
	mov eax, SYSCALL_EXIT
	mov ebx, NO_ERROR
	int 0x80
