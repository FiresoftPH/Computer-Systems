    .text
    .globl main
    
main:
    li  $v0, 5
    syscall

    move $t0, $v0
    li  $t1, 0
    li  $t2, 0

loop:
    addi	$t1, $t1, 1			# $t1 = $t1 + 1
    add     $t2, $t2, $t1       #
    beq		$t0, $t1, done	    # if $t0 == $t1 then goto done
    j		loop				# jump to loop
    
done:
    li      $v0, 1
    move    $a0, $t2
    syscall
    