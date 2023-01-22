        .data
str:    .asciiz "Computer Systems"
name:   .asciiz "Pattarapark"

        .text
        .globl main
main:
    # Code number four is for printing the string from the register $a0.
    # The code must load to the register $v0
    li  $v0, 4
    la  $a0, str
    # Pass the instruction to the OS
    syscall

    la  $a0, name
    syscall