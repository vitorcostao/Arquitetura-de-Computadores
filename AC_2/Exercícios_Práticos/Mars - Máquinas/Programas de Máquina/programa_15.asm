# Descrição das instruções

# Desvio condicional
# beq Registrador1, Registrador2, Label  
# bne Registrador1, Registrador2, Label

# Desvio incondicional
# j Label

.text
.globl main

main:

	lw $t0, a
	lw $t1, i
	addi $s0, $0, 0 
	
	addi $t2, $t0, 400
	
	loop:
	      beq $t0, $t2, fim 
	      
	      sll  $t3, $t1, 1 
	      addi $t3, $t3, 1 
	      
	      sw $t3, ($t0) 
	      
	      add  $s0, $s0, $t3 
	      
	      addi $t1, $t1, 1
	      addi $t0, $t0, 4
	      
	      j loop
	      
	fim: 
	
		sw $s0, ($t2)
		
.data
a: .word 0x10010008
i: .word 0

