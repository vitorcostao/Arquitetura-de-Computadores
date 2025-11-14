# Descrição das instruções


# Memória
# lw Registrador, deslocamento(Endereço ou Label)
# sw Registrador, deslocamento(Endereço ou Label)



.text
.globl main

main:

	lw $t0, x1 # $t0 = 15
	lw $t1, x2 # $t1 = 25
	lw $t2, x3 # $t2 = 13
	lw $t3, x4 # $t3 = 17
	
	add $t4, $t0, $t1 # t4 = (t0 + t1)
	add $t4, $t4, $t2 # t4 = (t0 + t1) + t2
	add $t4, $t4, $t3 # t4 = ((t0 + t1) + t2) + t3
	
	sw $t4, soma
	


.data
x1: .word 15 
x2: .word 25 
x3: .word 13 
x4: .word 17 
soma: .word -1


