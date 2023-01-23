    .data
n:  .word   0x2
m:  .word   0x3
r:  .space  4

    .text
    .globl main
main:
    # Load address, similar to load integer (immediate), it loads the address of "n" to a register.
    la  $t5, n
    # This is the array of data at [10010000] (n): 00000002  00000003  00000005  00000000 which means that t0 stores "2"
    lw  $t0, 0($t5)
    la  $t6, m
    # Same as above
    lw  $t1, 0($t6)

    addu $t2, $t0, $t1
    la  $t7, r
    sw  $t2, 0($t7)