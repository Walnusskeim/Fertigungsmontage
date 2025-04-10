section .text
	global _start	;must be declared for linker

_start:
	mov edx, len	;lengh of message
	mov ecx, msg	;message to write
	mov ebx, 1	;file descriptor (stdout)
	mov eax, 4	;system call number (sys_write)
	int 0x80	;call kernel
	
	mov edx, 9	;lengh of message
	mov ecx, s2	;message to write
	mov ebx, 1	;file descriptor (stdout)
	mov eax, 4	;system call number (sys_write)
	int 0x80	;call kernel
	
	mov eax, 1	;system call number (sys_exit)
	int 0x80	;call kernel
	
section .data
msg db 'Displaying 9 stars', 0xa	;a message
len equ $ - msg		; length of message
s2 times 9 db '*'
