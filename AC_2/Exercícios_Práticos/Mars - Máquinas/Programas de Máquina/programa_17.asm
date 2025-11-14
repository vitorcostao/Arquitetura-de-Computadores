# Descrição das instruções

# Desvio condicional
# beq Registrador1, Registrador2, Label  
# bne Registrador1, Registrador2, Label

# Desvio incondicional
# j Label


.text
.globl main
main:

    lw $t0, x # t0 = x
    lw $t1, y # t1 = y
    addi $t2, $t2, 0 # t2 = 0
    beq $t1, $zero, fim

loop:
    add $t2, $t2, $t0
    addi $t1, $t1, -1 
    bne $t1, $zero, loop 

fim:

.data
x: .word 0
y: .word 0
k: .word 0





