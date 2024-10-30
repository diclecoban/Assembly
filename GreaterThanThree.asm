.data
array: .word 1, 4, 6, 2, 3, 7, 8, 0, 5  # Dizi elemanları
length: .word 9                        # Dizi uzunluğu

.text
.globl main

main:
la $t0, array
lw $t1, length
li $t2, 0 #sayaç
li $t3, 0 #index

loop:
beq $t3, $t1, end
lw $t4, 0($t0)
addi $t0, $t0, 4
li $t5, 3
bgt $t4, $t5, increment_count
j next_element

increment_count:
addi $t2, $t2, 1

next_element:
addi $t3, $t3, 1
j loop

end:
move $a0, $t2
li $v0, 1
syscall

li $v0, 10
syscall
