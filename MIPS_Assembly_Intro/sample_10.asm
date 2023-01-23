    .data
x:  .word   0x10
y:  .word   0xffffffff

    .text
    .globl main
main:
    li  $t0, 0x10
    li  $t1, 0xffffffff
    # Multiply t0 and t1 together. The result was stored separately since the reserved register was only 32 bits. The first 32 bits is stored in
    # in t2. The real result is in t3. The overflow integer digits is in t2. It is up to the user to use all the digits or only the last 32 bits.
    # mflo and mfhi are the instructions explained above (the integer overflow situation).
    multu $t0, $t1
    mfhi $t2
    mflo $t3