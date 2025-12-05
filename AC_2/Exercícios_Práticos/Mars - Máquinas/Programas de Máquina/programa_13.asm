# Descrição das instruções

# Desvio condicional
# beq Registrador1, Registrador2, Label  
# bne Registrador1, Registrador2, Label

# Desvio incondicional
# j Label

# Descrição das instruções

# Desvio condicional
# beq Registrador1, Registrador2, Label  
# bne Registrador1, Registrador2, Label

# Desvio incondicional
# j Label


.text
.globl main

main:

	lw $t0, A # t0 = A
	
	sra $t1, $t0, 31
	beq  $t1, $zero, positivo
	sub  $t0, $zero, $t0
	sw   $t0, A

positivo:
    # FIM

.data
A: .word -7











