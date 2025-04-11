section .data						;Data segment
	userMsg db 'Please enter a number: '		;User being asked to enter a number
	lenUserMsg equ $- userMsg			;Length of message is as long as the userMsg
	
	dispMsg db 'You have entered: '
	lenDispMsg equ $- dispMsg			;Length of message is as long as the dispMsg
	
section .bss						;Uninitialized data
	num resb 5					; Reserve space for the entered number 
							;(up to 5 bytes = 40 bit)
	
section .text						;Code segment
	global _start
	
_start:
	mov eax, 4					;System Call (sys_write)
	mov ebx, 1					;file descriptor (stdout)
	mov ecx, userMsg				;Store userMsg in ECX
	mov edx, lenUserMsg				;Store lenUserMsg in EDX
	int 0x80					;Call kernel
	
	;Read and store the user input
	mov eax, 3					;System Call (sys_read)
	mov ebx, 2					;Store input in EBX (?)
	mov ecx, num					;Store the number in ECX
	mov edx, 5					;Store 5 bytes of the input information
	int 0x80					;Call kernel
	
	;Output the message 'You have entered: '
	mov eax, 4					;System Call (sys_write)
	mov ebx, 1					;file descriptor (stdout)
	mov ecx, dispMsg				;Output the text 'You have entered: '
	mov edx, lenDispMsg				;Store lenDispMsg in EDX
	int 0x80					;Call kernel
	
	;Display the number entered
	mov eax, 4					;System Call (sys_write)
	mov ebx, 1					;file descriptor (stdout)
	mov ecx, num					;Output the number
	mov edx, 5					;Output the number 5 bits long
	int 0x80					;Call kernel
	
	;Exit code
	mov eax, 1					;System Call (sys_exit)
	mov ebx, 0
	int 0x80					;Call kernel
	
