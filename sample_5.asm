# Below here is a way to represent an array inside the "n" variable.
    .data
n:  .word   0x2, 0x3, 0x4

    .text
    .globl  main
main:
    # Load the base address of "n" into $t5
    la  $t5, n
    # Loads "2" into t0 and "3" into t1
    lw  $t0, 0($t5)
    lw  $t1, 4($t5)
    addu $t2, $t0, $t1
    # Copies the value in the register to the memory. This value is stored behind the data in "n"
    sw  $t2, 12($t5)