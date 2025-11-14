# Descrição das instruções


# Memória
# lw Registrador, deslocamento(Endereço ou Label)
# sw Registrador, deslocamento(Endereço ou Label)



.text
.globl main

main:

	lw $t0, x # t0 = x
	lw $t1, z # t1 = z
	
	sub $t2, $t0, $t1 # t2 = x - z
	
	ori $t3, $zero, 0x493E # t3 = 0x493E 
	sll $t3, $t3, 4 # t3 = 0x493E0 
	
	add $t3, $t2, $t3 # t3 = (x - z) + 300000
	sw $t3, y
	
	


.data 
x: .word 100000 
z: .word 200000 
y: .word 0   # esse valor deverá ser sobrescrito após a execução do programa.

