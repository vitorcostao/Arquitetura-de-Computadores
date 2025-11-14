# Descrição das instruções


# sll (Shift Left Logical): Registrador destino, Registrador fonte, Quantia bits deslocados para direita
# srl (Shift Right Logical): Registrador destino, Registrador fonte, Quantia bits deslocados para esquerda
# sra (Shift Right Arithmetic): Registrador destino, Registrador fonte, Quantia bits deslocados para direita (1 - negativo / 0 - positivo)




.text
.globl main

main:
	
	ori $s0, $zero, 3 # -> s0 = 15
	ori $s1, $zero, 4 # -> s1 = 4
	
	sll $t0, $s0, 4   # -> t0 = 16x
	sub $t0, $t0, $s0 # -> t0 = 15x
	
	sll $t1, $s1, 6   # -> t1 = 64x
	add $t1, $t1, $s1 # -> t1 = 65x
	add $t1, $t1, $s1 # -> t1 = 66x
	add $t1, $t1, $s1 # -> t1 = 67x
	
	add $t2, $t1, $t0 # -> t2 = (15x + 67y)
	sll $t2, $t2, 2   # -> t2 = (15x + 67y) * 4
	add $s2, $zero, $t2 # -> z = t2
	
	