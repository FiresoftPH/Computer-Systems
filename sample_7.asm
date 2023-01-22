
        .data
num:    .space 4

    .text
    .globl main
main:
    # # This code will run after the console takes an input from the console (any input works) (runs stuff after syscall)
    li  $v0, 5
    syscall
    la  $t0, num
    sw  $v0, 0($t0)