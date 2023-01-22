        .data
num:    .space 4

    .text
    .globl main
main:
    li  $v0, 5
    syscall

    la  $t0, num
    sw  $v0, 0($t0)