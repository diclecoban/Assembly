.data
myNumber: .word 23
isPrime: .asciiz "The number is a prime number."
notPrime: .asciiz "The number isn't a prime number"


.text
.globl main


main:
lw $t1 myNumber
li $t2 2 #for increment


loop:
mul $t4, $t2, $t2  #if ($t2)^2 is greater than the number it means it's a prime number.
bgt $t4, $t1, prime

div $t1 $t2 
mfhi $t3
beq $t3 0 not_Prime 
addi $t2, $t2, 1
j loop

prime:
li $v0 4
la $a0 isPrime
syscall
j end

not_Prime:
li $v0 4
la $a0 notPrime
syscall 
j end

end:
li $v0 10
syscall