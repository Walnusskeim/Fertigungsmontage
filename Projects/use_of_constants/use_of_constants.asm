;This is just a test script to demonstrate, how goated constants can be
;15.04.2025 | Maximlian ❤

exit      equ 1
write     equ 4
stdin     equ 0
stdout    equ 1

section .data
	testMessage db 'Look! Constants are the GOATS!', 0xA,0xD
	lenTestMessage equ $- testMessage
	
	approvalMessage db 'Yeah, this guys right! It literally works!'
	lenApprovalMessage equ $- approvalMessage
	
section .text
	global _start

_start:
	mov eax, write
	mov ebx, stdout
	mov ecx, testMessage
	mov edx, lenTestMessage
	int 0x80
	
	mov eax, write
	mov ebx, stdout
	mov ecx, approvalMessage
	mov edx, lenApprovalMessage
	int 0x80
	
	mov eax, exit
	int 0x80
