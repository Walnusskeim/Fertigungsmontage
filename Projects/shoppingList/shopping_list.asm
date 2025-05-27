;Simple shopping list. First, a file is being created where you can write your items in.
;01.05.2025 | Maximilian

section .data
	hello db 'Hello, this is your shopping list! Type your item below:', 0xA, 0xD
	lenHello equ $- hello
	
	appr db 'Alright. Your item was saved :)', 0xA
	lenAppr equ $- appr
	
	INVENTORY TIMES 8 DW ' '

	
section .text
	global _start
	
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, hello
    mov edx, lenHello
    int 0x80

    mov eax, 1
	int 0x80
	
	
