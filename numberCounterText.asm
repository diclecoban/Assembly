.data
prompt: .asciiz "Please enter your text: "
buffer: .space 512
output: .asciiz "Numbers in your text "

.text
	li $v0 4
	la $a0 prompt
	syscall
	
	li $v0 8
	la $a0 buffer
	li $a1 511
	syscall
	
	la $t0 buffer
	li $t1 '0'
	li $t2 '9'
	li $t4 0 #counter
	
loop:
	lb $t3 0($t0)
	beq $t3 $zero done
	blt $t3 $t1 step
	bgt $t3 $t2 step
	j counter
	
counter:
	addi $t4 $t4 1

step: 
	addiu $t0 $t0 1
	j loop

done: 
	li $v0 4
	la $a0 output
	syscall
	
	li $v0 1
	move $a0 $t4
	syscall
	
	li $v0 10
	syscall
	