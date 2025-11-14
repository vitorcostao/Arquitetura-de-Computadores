# Descrição das instruções


# sll (Shift Left Logical): Registrador destino, Registrador fonte, Quantia bits deslocados para direita
# srl (Shift Right Logical): Registrador destino, Registrador fonte, Quantia bits deslocados para esquerda
# sra (Shift Right Arithmetic): Registrador destino, Registrador fonte, Quantia bits deslocados para direita (1 - negativo / 0 - positivo)


.text
.globl main

main:
	
	ori $8, $0, 0x01 # $8 = 0000 0001
	sll $8, $8, 31 # $8 = 1000 0000
	sra $8, $8, 31 # $8 = 1111 1111	
	
	