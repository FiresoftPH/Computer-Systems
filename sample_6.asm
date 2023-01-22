        .data
# Store a string inside the memory
str:    .asciiz "Computer Systems"

        .text
        .globl main
main:
    # You can just use "4" in load immediate
    li  $v0, 4
    # loads the address of the string to a0
    la  $a0, str
    syscall

main: