
section .data
	hello db 'Hello, this is your shopping list! ', 0xA
	lenHello equ $- hello
	
	input_msg db 'Type your item below:', 0xA, 0xD
	lenInput_msg equ $- input_msg
	
	appr db 'Alright. Your item was saved :)', 0xA
	lenAppr equ $- appr
	
	again db 'Want to add another item? Type "0" if yes and "1" if no', 0xA, 0xD
	lenAgain equ $- again
	
	type db 'Type your second item:', 0xA, 0xD
	lenType equ $- type
	
	bye db 'Ok bye.'
	lenBye equ $- bye

	
section .bss
	cart resw 2
	agn resb 1

	
section .text
	global _start
	
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, hello
    mov edx, lenHello
    int 0x80
    
    INPUT:
    mov eax, 4
    mov ebx, 1
    mov ecx, input_msg
    mov edx, lenInput_msg
    int 0x80
    
    mov eax, 3
    mov ebx, 0
    mov ecx, cart
    mov edx, 32
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, cart
    mov edx, 32
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, appr
    mov edx, lenAppr
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, again
    mov edx, lenAgain
    int 0x80
    
    mov eax, 3
    mov ebx, 0
    mov ecx, agn
    mov edx, 1
    int 0x80
    
    mov al, [agn]
    sub al, '0'
    
    CMP al, 0
    JZ AGAIN
	
	BYE:
    mov eax, 4
    mov ebx, 1
    mov ecx, bye
    mov edx, lenBye
    int 0x80
    
    mov eax, 1 		;calls sys_exit
    mov ebx, 0		
    int 0x80
    
    AGAIN:
    ;JMP INPUT
    mov eax, 4
    mov ebx, 1
    mov ecx, type
    mov edx, lenType
    int 0x80
	
	
	
    mov eax, 1
	int 0x80
