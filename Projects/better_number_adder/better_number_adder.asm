;A single digit number adder, that actually works like intended
;I hate my life omg why is this so complicated wtf
;14.04.2025 | Maximilian ❤

section .data
	firstNum db 'Welcome. Enter your first Number: '
	lenFirstNum equ $- firstNum
	
	scndNum db 'Enter the second number: '
	lenScndNum equ $- scndNum
	
	resText db 'The result is: '
	lenResText equ $- resText


section .bss
	num1 resw 2
	num2 resw 2
	res resd 1

section .text
	global _start
	
_start:
	;Print first message:
	mov eax, 4
	mov ebx, 1
	mov ecx, firstNum
	mov edx, lenFirstNum
	int 0x80
	
	;Get input of first message:
	mov eax, 3
	mov ebx, 0
	mov ecx, num1
	mov edx, 2  ;We want to read 2 Bytes
	int 0x80
	
	;Print second message:
	mov eax, 4
	mov ebx, 1
	mov ecx, scndNum
	mov edx, lenScndNum
	int 0x80
	
	;Get input of second message:
	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 2  ;We want to read 2 Bytes
	int 0x80
	
	
	;Convert num1 and num2 from ASCII to decimals:
	movzx eax, byte [num1]
	sub eax, '0'
	
	movzx ebx, byte [num2]
	sub ebx, '0'
	
	;Add them together (EBX to EAX):
	add eax, ebx
	add eax, '0'
	
	;Store result from EAX in res:
	mov [res], eax
	
	
	;Result text:
	mov eax, 4
	mov ebx, 1
	mov ecx, resText
	mov edx, lenResText
	int 0x80
	
	;Result:
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 4  ;We want to read 4 Bytes
	int 0x80
	
	;EXIT:
	mov eax, 1
	int 0x80

