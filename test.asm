.data
    message: .asciiz "enter integer "
    result: .asciiz "results "
    err: .asciiz "input < 0\n"
    newline: .asciiz "\n"

.globl main
.text

error:
    li $v0,4
    la $a0,err
    syscall
    j mainloop

main:

mainloop:
    li $v0,4
    la $a0,message
    syscall

    li $v0,5
    syscall
    move $t0,$v0

    blt $t0,0,error

    li $t1,1
    li $t2,1

loop:
    bgt $t2,$t0, done
    mult $t1,$t2
    mfhi $t1
    mflo $t1
    add $t2,$t2,1
    j loop

done:

    li $v0,4
    la $a0,result
    syscall

    li $v0,1
    add $a0,$t1,$0
    syscall

    li $v0,4
    la $a0,newline
    syscall

    j mainloop
