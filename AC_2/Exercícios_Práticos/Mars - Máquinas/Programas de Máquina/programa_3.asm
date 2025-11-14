# Descrição das instruções


# Aritméticas
# add:  Registrador Destino, Registrador A, Registrador B -> Dest = A + B
# addi: Registrador Destino, Registrador A, Imediato -> Dest = A + Imediato
# sub:  Registrador Destino, Registrador A, Registrador B -> Dest = A - B


# Lógicas
# andi: Registrador Destino, Registrador A, Imediato -> Dest = A & I
# ori:  Registrador Destino, Registrador A, Imediato -> Dest = A | I
# and:  Registrador Destino, Registrador A, Registrador B -> Dest = A & B
# xor:  Registrador Destino, Registrador A, Registrador B -> Dest = A XOR B
# nor:  Registrador Destino, Registrador A, Registrador B -> Dest = A NOR B


.text
.globl main

main:
	
	ori $s0, $zero, 3 # Atribuição s0 = 15
	ori $s1, $zero, 4 # Atribuição s1 = 4
	
	add $t0, $s0, $s0 # Atribuição t0 = 2x
	add $t0, $t0, $t0 # Atribuição t0 = 4x
	add $t0, $t0, $t0 # Atribuição t0 = 8x
	add $t0, $t0, $t0 # Atribuição t0 = 16x
	sub $t0, $t0, $s0 # Atribuição t0 = 15x
	
	add $t1, $s1, $s1 # Atribuição t1 = 2y
	add $t1, $t1, $t1 # Atribuição t1 = 4y
	add $t1, $t1, $t1 # Atribuição t1 = 8y
	add $t1, $t1, $t1 # Atribuição t1 = 16y
	add $t1, $t1, $t1 # Atribuição t1 = 32y
	add $t1, $t1, $t1 # Atribuição t1 = 64y
	add $t1, $t1, $s1 # Atribuição t1 = 65y
	add $t1, $t1, $s1 # Atribuição t1 = 66y
	add $t1, $t1, $s1 # Atribuição t1 = 67y
	
	add $t2, $t0, $t1 # Atribuição t2 = t0 + t1
	add $t2, $t2, $t2 # Atribuição t2 = 2 * t2
	add $t2, $t2, $t2 # Atribuição t2 = 4 * t2
	
	add $s2, $zero, $t2 # Atribuição z = (15x + 67y) * 4
	
	
	
	