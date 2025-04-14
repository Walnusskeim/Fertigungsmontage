;A program, in which the user can input two one-digit numbers.
;The chosen numbers will be shown to the user before adding them together.
;Yo ts does not work btw
;12.04.2025 | Maximilian ❤

section .data  ;Data segment
	firstNum db 'Welcome to the number adder. Please enter a digit: '  ;User being asked to enter a number
	lenFirstNum equ $- firstNum                                        ;Length of message is as long as firstNum
	
	scndNum db 'Enter a second digit: '                                ;User being asked to enter second number
	lenScndNum equ $- scndNum                                          ;Length of message is as long as scndNum
	
	dispRslt db 'The result of the addition: '                         ;Text before showing the result
	lenDispRslt equ $- dispRslt                                        ;Length of message is as long as dispRslt

section .bss
	num1 resb 5                                                        ;Reserve 5 Bytes (40 Bits) for the first number
	num2 resb 5                                                        ;Reserve 5 Bytes (40 Bits) for the second number
	res resb 5                                                         ;Reserve 5 Bytes (40 Bits) for the result
	
section .text
	global _start
	
_start:
	;Display the first message:
	mov eax, 4                                                         ;System call number (sys_write)
	mov ebx, 1                                                         ;file descriptor (stdout)
	mov ecx, firstNum                                                  ;Store firstNum in ECX
	mov edx, lenFirstNum                                               ;Store lenFirstNum in EDX
	int 0x80                                                           ;Call kernel
	
	;Read the first input:
	mov eax, 3                                                         ;System call number (sys_read)
	mov ebx, 0                                                         ;File descriptor (stdin)
	mov ecx, num1                                                      ;Store first input in ECX
	mov edx, 5                                                         ;Store 5 Bytes (40 Bits) in EDX
	int 0x80                                                           ;Call kernel	
	
	;Display the second message:
	mov eax, 4                                                         ;System call number (sys_write)
	mov ebx, 1                                                         ;File descriptor (stdout)
	mov ecx, scndNum                                                   ;Store scndNum in ECX
	mov edx, lenScndNum                                                ;Store lenScndNum in EDX
	int 0x80                                                           ;Call kernel
	
	;Read the second input:
	mov eax, 3                                                         ;System call number (sys_read)
	mov ebx, 0                                                         ;File descriptor (stdin)
	mov ecx, num2                                                      ;Store second input in ECX
	mov edx, 5                                                         ;Store 5 Bytes (40 Bits) in EDX
	int 0x80                                                           ;Call kernel
	
	;Move num1 to EAX and num2 to EBX
	;and convert them from ASCII to decimals:
	mov eax, [num1]
	sub eax, '0'
	
	mov ebx, [num2]
	sub ebx, '0'
	
	;Add both numbers together (EBX to EAX)
	;and convert them back into ASCII:
	add eax, ebx
	add eax, '0'
	
	;Store result from EAX to res:
	mov [res], eax
	
	;Result text:
	mov eax, 4                                                         ;System call number (sys_write)
	mov ebx, 1                                                         ;File descriptor (stdout)
	mov ecx, dispRslt                                                  ;Store dispRslt in ECX
	mov edx, lenDispRslt                                               ;Store lenDispRslt in EDX
	int 0x80                                                           ;Call kernel
	
	;Display the result:
	mov eax, 4                                                         ;System call number (sys_write)
	mov ebx, 1                                                         ;File descriptor (stdout)
	mov ecx, res                                                       ;Store res in ECX
	mov edx, 5                                                         ;Store 5 Bytes (40 Bits) in EDX
	int 0x80                                                           ;Call kernel
	
	;EXIT:
	mov eax, 1
	int 0x80
