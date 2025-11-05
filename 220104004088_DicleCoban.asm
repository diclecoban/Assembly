.data
	myNumber: .word 9
	isDiv: .asciiz "The number is divisible by 9."
	notDiv: .asciiz "The number isn't divisible by 9."

.text
	.globl main


main:
	li $t1 10 #to find digits
	li $t2 9 #to check if its divisible with 9
	lw $t3 myNumber
	li $t4 0
	li $t6 0
	
loop:
	beq $t3 $t6 check_div
	div $t3 $t1
	mfhi $t5
	mflo $t3
	
	#adding
	add $t4 $t5 $t4
	j loop
	
check_div:
	div $t4 $t2
	mfhi $t0
	beq $t0 $t6 is_div
	j not_div
	
is_div:
	li $v0 4
	la $a0 isDiv
	syscall
	j end
	
not_div:
	li $v0 4
	la $a0 notDiv
	syscall
	
end:
	li $v0 10
	syscall
