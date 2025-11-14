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
	
	ori  $s0, $zero, 1 # Atribuição -> x = 1
	add  $t0, $s0, $s0 # Atribuição -> t0 = 2x
	add  $t0, $t0, $t0 # Atribuição -> t0 = 4x
	add  $t0, $t0, $s0 # Atribuição -> t0 = 5x
	addi $s1, $t0, 15  # Atribuição -> y = 5x + 15
	
	