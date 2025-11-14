# Descrição das instruções


# Memória
# lw Registrador, deslocamento(Endereço ou Label)
# sw Registrador, deslocamento(Endereço ou Label)



.text
.globl main

main:

	lw $t0, x # t0 = x
	lw $t1, z # t1 = y
	
	sll  $t2, $t0, 7 # t2 = 128x
        sub  $t2, $t2, $t0 # t2 = 127x
	
	sll $t3, $t1, 6 # t3 = 64z
	add  $t3, $t3, $t1 # t3 = 65z
	
	sub  $t4, $t2, $t3 # t4 = 127x - 65z
        addi $t4, $t4, 1   # t4 = 127x - 65z + 1
        
        sw $t4, y
	
	


.data
x: .word 5
z: .word 7
y: .word 


