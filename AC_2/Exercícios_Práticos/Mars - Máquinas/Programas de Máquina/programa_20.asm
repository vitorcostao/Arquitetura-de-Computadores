# Descrição das instruções

# Multiplicação de inteiros
# mult Registrador1, Registrador2   # Multiplica dois inteiros signed
# multu Registrador1, Registrador2  # Multiplica dois inteiros unsigned

# Divisão de inteiros
# div Registrador1, Registrador2     # Divide dois inteiros signed
# divu Registrador1, Registrador2    # Divide dois inteiros unsigned

.text
.globl main
main:
    lw $s0, x
    andi $t0, $s0, 1
    beq $t0, $zero, even
    
    odd:
        mul $t1, $s0, $s0
        mul $t2, $t1, $s0
        mul $t3, $t2, $t1
        sub $t3, $t3, $t2
        addi $t3, $t3, 1
        sw $t3, y

    even:
        mul $t1, $s0, $s0
        mul $t2, $t1, $s0
        mul $t3, $t2, $s0
        add $t4, $t3, $t2
        sll $t1, $t1, 1
        sub $t4, $t4, $t1
        sw $t4, y

.data
x: .word 4
y: .word 0

