# .text
# .globl  main

# main: 
#     li      $t0, 0x2
#     li      $t1, 0x3
#     addu    $t2, $t0, $t1

.text
.globl  main

# These two codes have the same result with different approachs. "ori" instruction means "OR Immediate". When something OR an empty register,
# It returned the integer that it was "or" with

main: 
    ori     $t0, $0, 0x2
    ori     $t1, $0, 0x3
    addu    $t2, $t0, $t1

    # This syscall code will exit the program (Code number 10)
    li      $v0, 10
    syscall

# The code appeared in the QtSpim (Emulator) does not appear to be the same as our code. This is because the program contains Kernel Mode and User mode.
# The syscall function is one of the Kernel codes. You cant edit the Kernel codes for security reasons.