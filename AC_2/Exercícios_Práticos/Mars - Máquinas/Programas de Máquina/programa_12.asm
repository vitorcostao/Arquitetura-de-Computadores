
.text
.globl main
main:

	
	la $t0, x
	lw $t1, ($t0)    # $t1 = endereço de ptr2
	lw $t2, ($t1)    # $t2 = endereço de ptr1  
	lw $t3, ($t2)    # $t3 = endereço de k
	lw $t4, ($t3)    # $t4 = valor de k (2) ← FALTA ESTA LINHA!
	sll $t4, $t4, 1  # $t4 = 4
	sw $t4, ($t3)    # armazena 4 em k
	
	
	
#fim


.data
x: .word ptr2   
ptr2: .word ptr1   
ptr1: .word k    
k: .word 2