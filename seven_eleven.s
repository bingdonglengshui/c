# Read a number and print positive multiples of 7 or 11 < n
#
# Before starting work on this task, make sure you set your tab-width to 8!
# It is also suggested to indent with tabs only.
#
# YOUR-NAME-HERE, DD/MM/YYYY

#![tabsize(8)]

main:				# int main(void) {
   # Print prompt
    li $v0, 4                # syscall for print_string
    la $a0, prompt           # load address of prompt
    syscall

    li $v0, 5
    syscall
    move $t0,$v0  #number

    li $t1, 1     #i
    loop:
     bge $t1,$t0,end
     li      $t2, 7
     rem     $t3, $t1, $t2
     beq     $t3, 0, print_i


     li      $t2, 11
     rem     $t3, $t1, $t2
     beq     $t3, 0, print_i
     f1:
      addi $t1,$t1,1
     j loop

     j       end



print_i:
    li $v0, 1
    move $a0, $t1
    syscall
    li	$a0, '\n'
    li	$v0, 11
     syscall
    j f1;


end:
	li	$v0, 0
	jr	$ra		# return 0

	.data
prompt:
	.asciiz "Enter a number: "
newline:    .asciiz "\n"



