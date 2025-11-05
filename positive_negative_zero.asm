.data
positive: .asciiz "Positive"
negative: .asciiz "Negative"
zero: .asciiz "It's zero"
question: .asciiz "Please enter your number: "
myNumber: .word 



.text
	li $v0 4
	la $a0 question
	syscall
	
	li $v0 5
	la $a0 myNumber
	syscall
	move $t0 $v0

analyze:
	beq $t0 $zero isZero
	bgtz $t0 isPos
	bltz $t0 isNeg

isZero:
	li $v0 4
	la $a0 zero
	syscall
	
	li $v0 10
	syscall
isPos:
	li $v0 4
	la $a0 positive
	syscall
	
	li $v0 10
	syscall
isNeg:
	li $v0 4
	la $a0 negative
	syscall
	
	li $v0 10
	syscall