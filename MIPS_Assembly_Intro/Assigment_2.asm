        .data
x:      .asciiz "Enter your number here: "
y:      .asciiz "Your answer is: "
z:      .asciiz "The number entered is lesser than 0. "
q:      .asciiz "Overflow Error "
v:      .asciiz "\n"
        .text
        .globl main

main:
    # Print the introduction message and ask the user for a number
    li          $v0, 4
    la		    $a0, x
    syscall
    
    li          $v0, 5
    syscall

    move        $t0, $v0

    beq         $t0, 0, except

    slt		    $t3, $t0, 0
    beq         $t3, 1, error 

    # From testing, the factorial of number greater than 12 exceeds the 32 bit unsigned integer limit.
    sgt         $t3, $t0, 12
    beq         $t3, 1, overflow 
    li          $t1, 1

loop:
    # The main loop that calculates the factorial.
    beq         $t0, 1, done
    multu       $t1, $t0
    mfhi        $t2
    mflo        $t1
    sub         $t0, $t0, 1
    j           loop

done:
    # Exiting the loop and shows the answer and ask for another input
    li          $v0, 4
    la          $a0, y
    syscall

    move        $a0, $t1
    li          $v0, 1
    syscall

    li          $v0, 4
    la          $a0, v
    syscall

    j main

except:
    # Exiting the loop and shows the answer and ask for another input
    li          $v0, 4
    la          $a0, y
    syscall

    li          $a0, 1
    li          $v0, 1
    syscall

    li          $v0, 4
    la          $a0, v
    syscall

    j main

error:
     # If the number is lesser than zero, the error message will be shown
     li         $v0, 4
     la         $a0, z
     syscall

     li         $v0, 4
     la         $a0, v
     syscall

     j          main
    
overflow: 
     # If the input is greater than 12, this error will be shown
     li         $v0, 4
     la         $a0, q
     syscall

     li         $v0, 4
     la         $a0, v
     syscall

     j          main
     

            


    