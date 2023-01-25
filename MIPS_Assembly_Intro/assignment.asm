        .data
x:      .asciiz "Enter your number here: "
y:      .asciiz "Your answer is: "
z:      .asciiz "The number entered is lesser than 0. "
v:      .asciiz "\n"
        .text
        .globl main

main:
    li          $v0, 4
    la		    $a0, x
    syscall
    
    li          $v0, 5
    syscall

    move        $t0, $v0

    beq         $t0, 0, error
    li          $t1, 1

loop:
    beq         $t0, 1, done
    multu       $t1, $t0
    mfhi        $t2
    mflo        $t1
    sub         $t0, $t0, 1
    j           loop

done:
    li          $v0, 4
    la          $a0, y
    syscall

    move        $a0, $t1
    li          $v0, 1
    syscall

    li         $v0, 4
    la         $a0, v
    syscall         

    j           main

error:
     li         $v0, 4
     la         $a0, z
     syscall

     li         $v0, 4
     la         $a0, v
     syscall

     j          main
    

            


    