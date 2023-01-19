# The data section consist of variables stored in this section.
    .data
n:  .word   0x7
m:  .word   0x8
# The .space operator makes the reserve space for 12 bytes (3 indices width)
r:  .space  12
# Which means that "9" will be stored behind the reserved space, this "9" will be stored in the new array because the maximum size is 32 bytes
q:  .word   0x9

    .text
    .globl  main

main:
    lw		$t0, n
    lw      $t1, m
    addu    $t2, $t0, $t1
    # This is a pseudo instruction, usually assigning "r" directly. 
    sw		$t2, r
    lw      $t3, q