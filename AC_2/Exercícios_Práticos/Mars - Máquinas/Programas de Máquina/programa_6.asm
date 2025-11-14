# Descrição das instruções


# sll (Shift Left Logical): Registrador destino, Registrador fonte, Quantia bits deslocados para direita
# srl (Shift Right Logical): Registrador destino, Registrador fonte, Quantia bits deslocados para esquerda
# sra (Shift Right Arithmetic): Registrador destino, Registrador fonte, Quantia bits deslocados para direita (1 - negativo / 0 - positivo)


.text
.globl main

main:
	
	ori $s0, $zero, 0xFFFF # s0 = FFFF
	sll $s0, $s0, 16 # s0 = FFFF 0000
	ori $t0, $zero, 0XFFFf # t0 = 0000 FFFF
	or  $s0, $t0, $s0 # s0 = FFFF FFFF
	
	ori $s1, $zero, 0x493E # s1 = 0x493E
	sll $s1, $s1, 4 # s1 = 0x493E0
	
	sll $t1, $s1, 2
	
	sub $s2, $s0, $t1 # s2 = Maior possível - 4y	
	