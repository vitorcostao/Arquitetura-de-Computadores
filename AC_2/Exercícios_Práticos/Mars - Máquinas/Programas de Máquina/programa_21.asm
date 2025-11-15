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
    sra $t0, $s0, 31
    beq $t0, $zero, positive

    non_positive:
        mult $s0, $s0
        mflo $t1
        mult $t1, $s0
        mflo $t2
        mult $t2, $s0
        mflo $t3
        addi $t3, $t3, -1
        sw $t3, y


    positive:
        mult $s0, $s0
        mflo $t1
        mult $t1, $s0
        mflo $t2
        addi $t2, $t2, 1
        sw $t2, y

.data
x: .word 3
y: .word 0



