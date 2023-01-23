        .data
str:    .asciiz "Hello World" # Array of ASCIIZ Characters
        .text
        .globl main
main:
    # Print hello world. "4" for print string.
    li      $v0, 4
    la      $a0, str
    syscall