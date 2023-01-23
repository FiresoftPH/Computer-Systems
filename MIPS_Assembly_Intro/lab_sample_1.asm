# The data segment could be below the main codes. The "n", "m" or others are called symbols.
        .data
n:      .word   0x2
m:      .word   0x3
r:      .space  12 # Number of bytes reserved (could be for an array). 3 words in total. Usually dont have any initial value stored in the array.
q:      .word   0x9

        .text
        .globl  main
main:
    lw      $t0, n # load n to $t0
    lw      $t1, m # load m to $t1

    addu    $t2, $t0, $t1 # add t0 and t1

    sw      $t2, r # Store the result in r
    lw      $t3, q