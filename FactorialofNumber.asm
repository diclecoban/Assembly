.data 
myNumber: .word 4
theText: .asciiz "factorial of number: "

.text
.globl main


main:
lw $t1 myNumber
li $t2 1 #for multiplication


loop:
beq $t1, 1, printing
mul $t2, $t1, $t2
sub $t1, $t1, 1
j loop

printing:
li $v0, 4 
la $a0, theText
syscall

li $v0, 1   #printing result
move $a0, $t2
syscall

end:
li $v0, 10
syscall