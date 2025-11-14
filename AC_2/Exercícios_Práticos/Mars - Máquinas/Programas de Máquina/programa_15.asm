# Descrição das instruções

# Desvio condicional
# beq Registrador1, Registrador2, Label  
# bne Registrador1, Registrador2, Label

# Desvio incondicional
# j Label


.text
.globl main
main:
    ori $s0, $zero, 0    # i = 0
    ori $s1, $zero, 0    # soma = 0
    ori $s2, $zero, 0    # resultado temporário
    ori $t1, $zero, 100  # n = 100
    la  $t0, vetor       # t0 = endereço base do vetor

loop:
    sll $t2, $s0, 1      # t2 = 2*i
    addi $s2, $t2, 1     # result = 2*i + 1
    sw   $s2, 0($t0)     # vetor[i] = result

    add  $s1, $s1, $s2   # soma += result

    addi $t0, $t0, 4     # próximo endereço
    addi $s0, $s0, 1     # i++
    bne  $s0, $t1, loop  # repetir enquanto i != 100
    
    sw   $s1, 0($t0)

.data
vetor:  .space 400   
soma:   .word 0      


