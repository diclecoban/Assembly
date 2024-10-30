.data 
newline: .asciiz "\n"
length: .word 6  

.text
.globl main

main:
    li $t0, 0         #first element 
    li $t1, 1           #second element
    lw $t2, length    
    li $t5, 0           #for index

fibo_loop:
    beq $t5, $t2, end    


    li $v0, 1
    move $a0, $t0 #printing the element
    syscall


    li $v0, 4
    la $a0, newline
    syscall


    add $t3, $t0, $t1   #summation of last two number
    move $t0, $t1       
    move $t1, $t3      #updating the last number before the updated one

    addi $t5, $t5, 1    
    j fibo_loop          

end:
    li $v0, 10     
    syscall