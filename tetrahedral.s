# Read a number n and print the first n tetrahedral numbers
# https://en.wikipedia.org/wiki/Tetrahedral_number
#
# Before starting work on this task, make sure you set your tab-width to 8!
# It is also suggested to indent with tabs only.
#
# YOUR-NAME-HERE, DD/MM/YYYY

#![tabsize(8)]

main:				# int main(void) {

	la	$a0, prompt	# printf("Enter how many: ");
	li	$v0, 4
	syscall

	li	$v0, 5		# scanf("%d", number);
	syscall
	move $t0,$v0 # how_many
	li $t1,1    #n
	loop1:
      bgt $t1,$t0,end
      li $t2,0    #total
      li $t3,1     #j
      loop2:
      bgt $t3,$t1,f1
      li $t4,1
      loop3:
      bgt $t4,$t3,f2
      add $t2,$t2,$t4
      addi $t4,$t4,1
      j loop3
      f2:
      addi $t3,$t3,1
      j loop2
      f1:
     move	$a0, $t2
	 li	$v0, 1
	 syscall

	 li	$a0, '\n'
	 li	$v0, 11
	 syscall
	 addi $t1,$t1,1
      j loop1

end:
	li	$v0, 0
	jr	$ra		# return 0

	.data
prompt:
	.asciiz "Enter how many: "
