# Descrição das instruções

# Desvio condicional
# beq Registrador1, Registrador2, Label  
# bne Registrador1, Registrador2, Label

# Desvio incondicional
# j Label


.text
.globl main
main:

	lw   $t0, x # x
   	lw   $t1, y # y
    	lw   $t2, z # z
    	
    	mult $t0, $t1 
    	mflo $t3   
    	
    	div $t3, $t2
   	mflo $t4
   	
        sw $t4, resultado       

.data
x: .word 0x186A00
y: .word 0x13880
z: .word 0x61A80
resultado: .word 0





