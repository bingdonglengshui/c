# Read three numbers `start`, `stop`, `step`
# Print the integers bwtween `start` and `stop` moving in increments of size `step`
#
# Before starting work on this task, make sure you set your tab-width to 8!
# It is also suggested to indent with tabs only.
#
# YOUR-NAME-HERE, DD/MM/YYYY

#![tabsize(8)]
main:				# int main(void)
	la	$a0, prompt1	# printf("Enter the starting number: ");
	li	$v0, 4
	syscall

	li	$v0, 5		# scanf("%d", number);
	syscall
	move $t0,$v0

	la	$a0, prompt2
    li	$v0, 4
    syscall

    li	$v0, 5
    syscall
    move $t1,$v0

    la	$a0, prompt3
    li	$v0, 4
    syscall

    li $v0, 5
    syscall
    move $t2,$v0

    bge $t1,$t0,b1
    bge $t2,0 ,b1
    move $t4,$t0
    for:
    blt  $t4,$t1,b1
    move $a0,$t4
    li	$v0, 1
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    add $t4,$t4,$t2
    j for

    b1:
    ble $t1,$t0, end
    ble $t2,0 ,end
     move $t4,$t0
     for2:
     bgt  $t4,$t1,end
     move $a0, $t4
     li	$v0, 1
     syscall
     li $v0, 4
     la $a0, newline
     syscall
     add $t4,$t4,$t2
     j for2

end:
	li	$v0, 0
	jr	$ra		# return 0

	.data
prompt1:
	.asciiz "Enter the starting number: "
prompt2:
	.asciiz "Enter the stopping number: "
prompt3:
	.asciiz "Enter the step size: "
newline:
    .asciiz "\n"
