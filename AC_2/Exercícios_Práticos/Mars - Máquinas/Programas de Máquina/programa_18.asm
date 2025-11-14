# Descrição das instruções

# Desvio condicional
# beq Registrador1, Registrador2, Label  
# bne Registrador1, Registrador2, Label

# Desvio incondicional
# j Label




.text
.globl main
main:

    lw $s0, x # s0 = x
    lw $s1, y # s1 = y

    add $s2, $zero, $zero  # k = 0 
    add $t1, $zero, $zero  # i = 0
    add $t2, $zero, $zero  # j = 0
    add $t3, $zero, $zero  # soma parcial
    add $t4, $s0, $zero    # soma acumulada

    beq $s1, $zero, store 
    addi $s2, $zero, 1

pot:    
    addi $t1, $t1, 1
    add $t2, $zero, $zero
    add $t3, $zero, $zero

    bne $t1, $s1, multi  
    j fim                 

multi:
    add $t3, $t3, $t4
    addi $t2, $t2, 1
    bne $t2, $s0, multi
    add $t4, $zero, $t3
    j pot

fim:
    add $s2, $zero, $t4    
    
    
store:
sw $s2, k


.data
x: .word 2
y: .word 3
k: .word 0