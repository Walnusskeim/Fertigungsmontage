section .data
	msg db 'Die größte Zahl ist: '
	lenMsg equ $- msg
	
	num1 dd '47'
	num2 dd '69'
	num3 dd '18'


section .bss
	largest resb 2


section .text
	global _start

_start:
	mov ecx, [num1]
	cmp ecx, [num2]
	jg COMPSCND
	
COMPSCND:
	mov ecx, [num2]
	cmp ecx, [num3]
	jge EXIT
	

EXIT:
	mov [largest], ecx
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, lenMsg
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, largest
	mov edx, 2
	int 0x80
	
	mov eax, 1
	int 0x80
	
	
	
