    .data
# Define the statement for printing later
strEq:  .asciiz "Equal"
strNe:  .asciiz "Not equal"

    .text
    .globl main
main:
    li      $v0, 5
    syscall
    # This command takes the value from v0 to t0
    move 	$t0, $v0		    # $t0 = $v0

    li      $v0, 5
    syscall
    move    $t1, $v0

    bne		$t0, $t1, printNe	# if $t0 != $t1 then goto printNe

printEq:
    la      $a0, strEq
    j		print				# jump to print
    
printNe:
    la      $a0, strNe
    j		print				# jump to print
    
print:
    li      $v0, 4
    syscall
    