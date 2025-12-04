# Descrição das instruções


# Memória
# lw Registrador, deslocamento(Endereço ou Label)
# sw Registrador, deslocamento(Endereço ou Label)


.text 
.globl main

main: 
		
	lw $t0, ptr3
	lw $t1, ($t0)
	lw $t2, ($t1)
	lw $s0, ($t2)
	
	sll $s0, $s0, 1
	
	sw $s0, x
	
.data 
x: .word 5
ptr1: .word x 
ptr2: .word ptr1
ptr3: .word ptr2