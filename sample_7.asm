        .data
num:    .space 4

    .text
    .globl main
main:
    # This code means read integer from console and stored to v0
    li  $v0, 5
    syscall

    la  $t0, num
    # Store this variable to some where else
    sw  $v0, 0($t0)