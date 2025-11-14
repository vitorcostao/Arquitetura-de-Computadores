# Descrição das instruções


# sll (Shift Left Logical): Registrador destino, Registrador fonte, Quantia bits deslocados para direita
# srl (Shift Right Logical): Registrador destino, Registrador fonte, Quantia bits deslocados para esquerda
# sra (Shift Right Arithmetic): Registrador destino, Registrador fonte, Quantia bits deslocados para direita (1 - negativo / 0 - positivo)






.text
.globl main

main:
	
	ori $s0, $zero, 0x186A # s0 = 6250
	sll $s0, $s0, 4	 # s0 = 6250 * 16
	
	
	ori $s1, $zero, 0x30D4 # s1 = 12500
	sll $s1, $s1, 4 # s1 = 12500 * 16
	
	add $s2, $s0, $s1
	
	