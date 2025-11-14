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
	
	andi $t1, $t0, 1  # t1 = t0 & 1
	beq  $t1, $zero, par # par
	bne  $t1, $zero, impar # impar

par:
    la   $t2, B
    sw   $zero, ($t2)

impar:
    la   $t2, B
    addi $t3, $zero, 1
    sw   $t3, ($t2)

.data
A: .word 5
B: .word


