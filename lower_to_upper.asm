.data
prompt: .asciiz "Please enter your text: "
output: .asciiz "New text: "
buffer: .space 512
nl:     .asciiz "\n"

.text
.globl main
main:
    # input
    li   $v0, 4
    la   $a0, prompt
    syscall

    li   $v0, 8
    la   $a0, buffer
    li   $a1, 512
    syscall

    # dönüştür (in-place)
    la   $t0, buffer       # p
    li   $t1, 'a'
    li   $t2, 'z'

loop:
    lb   $t3, 0($t0)       # c = *p
    beq  $t3, $zero, done  # '\0' ise bitir
    li   $t4, 10           # '\n'
    beq  $t3, $t4, term    # newline'da sonlandırmak istersen

    # 'a'..'z' aralığı mı?
    blt  $t3, $t1, step    # 'a'dan küçükse küçük harf değil
    bgt  $t3, $t2, step    # 'z'den büyükse küçük harf değil
    addiu $t3, $t3, -32    # küçüğü büyüğe çevir
    sb   $t3, 0($t0)       # geri yaz

step:
    addiu $t0, $t0, 1
    j    loop

# newline gördüğünde string'i burada sonlandırmak istersen:
term:
    sb   $zero, 0($t0)     # '\n' yerine '\0' yaz
    j    done

done:
    # çıktıyı yaz
    li   $v0, 4
    la   $a0, output
    syscall

    li   $v0, 4
    la   $a0, buffer
    syscall

    li   $v0, 10
    syscall
