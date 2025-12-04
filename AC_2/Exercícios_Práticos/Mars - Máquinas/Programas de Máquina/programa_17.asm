
.text
.globl main

main:
	
	lw $s0, x
	lw $s1, y
	
	add $t0, $s0, $zero
	beq $s1, $zero, fim
	addi $t1, $zero, 1
	
	loop:
		beq $t1, $s1, fim
		
		add $t0, $t0, $s0
		addi $t1, $t1, 1
		
		j loop
		
	fim:
		sw $t0, k
	
	
.data
x: .word 5
y: .word 6
k: .word 0



