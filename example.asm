.data 
string:          .space 512
question:        .asciiz "Please enter your text: "
string_letters:  .asciiz "Your text letters are: "
nl:              .asciiz "\n"
letters:         .word 0

.text
.globl main
main:
    # prompt
    li   $v0, 4
    la   $a0, question
    syscall

    # read_string
    li   $v0, 8
    la   $a0, string
    li   $a1, 512
    syscall

    # analiz: a0 = &string
    la   $a0, string
    jal  analyze
    sw   $v0, letters        # sonucu belleğe de yaz

    # "Your text letters are: "
    li   $v0, 4
    la   $a0, string_letters
    syscall

    # sayiyi yaz
    li   $v0, 1
    lw   $a0, letters
    syscall

    # newline ve cikis
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 10
    syscall

########################################
# analyze(a0 = &buffer)
# Döner: v0 = harf sayısı
########################################
analyze:
    addiu $sp, $sp, -8
    sw    $ra, 4($sp)
    sw    $t0, 0($sp)

    move  $t0, $a0          # p = buffer
    li    $v0, 0            # count = 0

loop:
    lb    $t1, 0($t0)       # c = *p
    beq   $t1, $zero, done_a
    li    $t2, 10           # '\n'
    beq   $t1, $t2, done_a

    # 'A'..'Z' ?
    li    $t3, 'A'
    li    $t4, 'Z'
    blt   $t1, $t3, chk_lower
    bgt   $t1, $t4, chk_lower
    addiu $v0, $v0, 1
    j     step

chk_lower:
    # 'a'..'z' ?
    li    $t3, 'a'
    li    $t4, 'z'
    blt   $t1, $t3, step
    bgt   $t1, $t4, step
    addiu $v0, $v0, 1

step:
    addiu $t0, $t0, 1       # p++
    j     loop

done_a:
    lw    $t0, 0($sp)
    lw    $ra, 4($sp)
    addiu $sp, $sp, 8
    jr    $ra
