    .data
x:  .word   0x10
y:  .word   0xffffffff

    .text
    .globl main
main:
    li  $t0, 0x10
    li  $t1, 0xffffffff
    multu $t0, $t1
    mfhi $t2
    mflo $t3