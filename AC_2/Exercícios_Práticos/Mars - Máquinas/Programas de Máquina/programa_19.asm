# Descrição das instruções

# Multiplicação de inteiros
# mult Registrador1, Registrador2   # Multiplica dois inteiros signed
# multu Registrador1, Registrador2  # Multiplica dois inteiros unsigned

# Divisão de inteiros
# div Registrador1, Registrador2     # Divide dois inteiros signed
# divu Registrador1, Registrador2    # Divide dois inteiros unsigned

.text
.globl main         # O valor presente em A é 2 em B é 4 para a execução deste programa -> Não foi possível exibir no print devido ao tamanho.
main:

    lw $s0, A
    lw $s1, B
    add $t0, $zero, $zero
    add $t2, $s0, $zero
	count0:
    		beq $t2, $zero, done0
    		srl $t2, $t2, 1
    		addi $t0, $t0, 1
    		j count0
	done0:
    		add $t1, $zero, $zero
    		add $t2, $s1, $zero
	count1:
    		beq $t2, $zero, done1
    		srl $t2, $t2, 1
    		addi $t1, $t1, 1
    		j count1
	done1:
    		sub $t4, $t0, 32
    		beq $t4, $zero, mul64
    		bne $t4, $zero, check1
	check1:
    		sub $t4, $t1, 32
    		beq $t4, $zero, mul64
    		bne $t4, $zero, mul32
	mul32:
    		mul $s2, $s0, $s1
	mul64:
    		mult $s0, $s1
    		mflo $s2
    		mfhi $s3


.data
A: .word 2
B: .word 4
