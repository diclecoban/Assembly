.data
myNumber: .word 123
isPalindrome: .asciiz "The number is a palindrome."
notPalindrome: .asciiz "The number is not a palindrome."

.text
.globl main

main:
    lw $t0, myNumber
    move $t1, $t0 #copying the original number
    li $t2, 0   # This is going to be reverse number
    li $t3, 10   # For digit

reverse_loop:
    beq $t1, 0, check_palindrome
    div $t1, $t3 #divide by 10
    mfhi $t4             
    mflo $t1               

    # Updating the reverse number
    mul $t2, $t2, $t3
    add $t2, $t2, $t4
    j reverse_loop 

check_palindrome:
    beq $t0, $t2, palindrome
    j not_palindrome

palindrome:
    li $v0, 4
    la $a0, isPalindrome
    syscall
    j end_program

not_palindrome:
    li $v0, 4
    la $a0, notPalindrome
    syscall

end_program:
    li $v0, 10
    syscall