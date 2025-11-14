# Descrição das instruções


# sll (Shift Left Logical): Registrador destino, Registrador fonte, Quantia bits deslocados para direita
# srl (Shift Right Logical): Registrador destino, Registrador fonte, Quantia bits deslocados para esquerda
# sra (Shift Right Arithmetic): Registrador destino, Registrador fonte, Quantia bits deslocados para direita (1 - negativo / 0 - positivo)



.text
.globl main

main:
	
	ori $8, $0, 0x1234 # t0 = 0x1234
	sll $8, $8, 16 # t0 = 0x12340000
	or $8, 0x5678 # t0 = 0x12345678
	
	srl $9, $8, 24 # t1 = 0x00000012
	
	srl $10, $8, 16 # t2 = 0x00001234
	andi $10, $10, 0xFF # t2 = 0x00000034
	
	srl $11, $8, 8 # t3 = 0x00123456
	andi $11, $11, 0xFF # t3 = 0x00000056
	
	andi $12, $8, 0xFF # t3 = 0x00000056
	
	
	
	