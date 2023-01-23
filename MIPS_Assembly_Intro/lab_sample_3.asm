    .text
    .globl main
    
main:
    # Ask the user for the starting number and store it in v0
    li      $v0, 5
    syscall

    # Similar to sample_8, you store the number some where else to allow v0 to use for command codes.
    move    $t0, $v0
    # Without the pseudo instruction, you can use:
    # andi    $t0, $v0, -1
    # ori     $t0, $v0, 0
    li      $t1, 0
    li      $t2, 0

loop:
    addi	$t1, $t1, 1			# $t1 = $t1 + 1
    add     $t2, $t2, $t1
    beq		$t0, $t1, done	    # if $t0 == $t1 then goto done
    j		loop				# jump to loop
    
done:
    li      $v0, 1
    # move    $a0, $t1
    move    $a0, $t2
    syscall