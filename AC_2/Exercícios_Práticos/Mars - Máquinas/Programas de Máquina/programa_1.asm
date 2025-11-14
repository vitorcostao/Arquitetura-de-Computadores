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

	# Atribuição de valores
	ori $s0, $zero, 2 # a
	ori $s1, $zero, 3 # b
	ori $s2, $zero, 4 # c
	ori $s3, $zero, 5 # d
	
	# Somando valores
	add $t0, $s0, $s1 # Atribuição -> t0: s0 + s1 (a + b)
	add $t1, $s2, $s3 # Atribuição -> t1: s2 + s3 (c + d)
	sub $s4, $t0, $t1 # Atribuição -> (x)s4: t0 - t1 
	
	sub $t3, $s0, $s1 # Atribuição -> t3: s0 - s1 (a - b)
	add $s5, $t3, $s4 # Atribuição -> (y)s5: t3 - s4 (t3 + x)
	sub $s1, $s4, $s5 # Atribuição -> s1 = x - y
	
	