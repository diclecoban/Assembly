    .data
array:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10    # Array of integers
size:   .word 10                               # Size of the array

    .text
    .globl main
main:
	la $t0, array
	lw $t1, size
	li $t2, 0 #assigned for summation
	li $t3, 0 #index
	
loop:
	beq $t3, $t1, end
	lw $t4, 0($t0)
	addi $t0, $t0, 4
	add $t2, $t4, $t2


increment_count:
	addi $t3, $t3, 1
	j loop
	
end:
	move $a0, $t2
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
