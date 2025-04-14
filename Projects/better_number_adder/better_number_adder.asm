;A single digit number adder, that actually works like intended
;I hate my life omg why is this so complicated wtf
;14.04.2025 | Maximilian ❤

section .data
	firstNum db 'Welcome. Enter your first Number: '  ;First message
	lenFirstNum equ $- firstNum                       ;Length of message is equal to firstNum
	
	scndNum db 'Enter the second number: '            ;Second message
	lenScndNum equ $- scndNum                         ;Length of message is equal to scndNum
	
	resText db 'The result is: '                      ;Result text
	lenResText equ $- resText                         ;Length of message is equal to resText


section .bss
	num1 resw 2                                       ;Define variable "num1" and reserve 2x2 Bytes
	num2 resw 2                                       ;Define variable "num2" and reserve 2x2 Bytes
	res resd 1                                        ;Define variable "res" and reserve  1x4 Bytes

section .text
	global _start
	
_start:
	;Print first message:
	mov eax, 4                                       ;sys_call (sys_write)
	mov ebx, 1                                       ;stdout
	mov ecx, firstNum                                ;Load firstNum into ECX
	mov edx, lenFirstNum                             ;Load lenFirstNum into EDX
	int 0x80                                         ;Call kernel
	
	;Get input of first message:
	mov eax, 3                                       ;sys_call (sys_read)
	mov ebx, 0                                       ;stdin
	mov ecx, num1                                    ;Load num1 into ECX
	mov edx, 4                                       ;Load 4 Bytes into EDX
	int 0x80                                         ;Call kernel
	
	;Print second message:
	mov eax, 4                                       ;sys_call (sys_write)
	mov ebx, 1                                       ;stdout
	mov ecx, scndNum                                 ;Load scndNum into ECX
	mov edx, lenScndNum                              ;Load lenScndNum into EDX
	int 0x80                                         ;Call kernel
	
	;Get input of second message:
	mov eax, 3                                       ;sys_call (sys_read)
	mov ebx, 0                                       ;stdin
	mov ecx, num2                                    ;Load num2 into ECX
	mov edx, 4                                       ;Load 4 Bytes into EDX
	int 0x80                                         ;Call kernel
	
	
	;Convert num1 and num2 from ASCII to decimals:
	movzx eax, byte [num1]                           ;movzx – "Move with Zero Extend"
	                                                 ;=> Load a value into a register
	                                                 ;and fill the unoccupied space with zeros
	sub eax, '0'                                     ;Substract 0 to make it a decimal
	
	movzx ebx, byte [num2]
	sub ebx, '0'
	
	;Add them together (EBX to EAX):
	add eax, ebx
	add eax, '0'                                     ;Add 0 to convert them to ASCII again
	
	;Store result from EAX in res:
	mov [res], eax
	
	
	;Result text:
	mov eax, 4                                       ;sys_call (sys_write)
	mov ebx, 1                                       ;stdout
	mov ecx, resText                                 ;Load resText into ECX
	mov edx, lenResText                              ;Load lenResText into EDX
	int 0x80                                         ;Call kernel
	
	;Result:
	mov eax, 4                                       ;sys_call (sys_write)
	mov ebx, 1                                       ;stdout
	mov ecx, res                                     ;Load res into ECX
	mov edx, 4                                       ;Load 4 Bytes into EDX
	int 0x80                                         ;Call kernel
	
	;EXIT:
	mov eax, 1
	int 0x80

