    .text
    .globl main

# "addu" add unsigned "li" load integer
main:
    li  $t0, -0x2
    li  $t1, -0x3
    addu $t2, $t0, $t1