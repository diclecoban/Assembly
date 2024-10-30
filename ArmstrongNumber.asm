.data
myNumber: .word 153
isEqual: .asciiz "The number is Armstrong"
isNotEqual: .asciiz "The Number is not Armstrong"

.text
.globl main

main:
lw $t1 myNumber
li $t2 0 #to find the end of the digits
li $t3 10 #for finding digits
li $t6 0 #using for summation
li $t7 0 #temporary number for multiplication

loop:
beq $t1 $t2 comp #if $t1 is 0 it means the digits are over
div $t1 $t3 # $t1 / 10 
mfhi $t4 #kalan
mflo $t5 #bölüm
move $t1 $t5 #updating the number to find the other digits when jumping at the beginning of the loop

# multiplication of cube and summation
mul $t7, $t4, $t4 # $t7 = $t4 * $t4
mul $t7, $t4, $t7 # $t7 = $t7 ($t4*$t4] * $t4
add $t6, $t6, $t7 # $t6 = 0 + $t7
j loop

comp:
lw $t8 myNumber
beq $t6 $t8 equal
li $v0 4
la $a0 isNotEqual
syscall
j end

equal:
li $v0 4
la $a0 isEqual
syscall

end:
li $v0 10
syscall