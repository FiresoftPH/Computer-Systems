          .data
x:        .asciiz "Most"
y:        .asciiz "Pattarapark"

          .text
          .globl main

main:
    li    $v0, 4
    la    $a0, x
    syscall

    li    $v0, 4
    la    $a0, y
    syscall

    li    $v0, 10
    syscall
    
