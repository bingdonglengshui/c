# read a mark and print the corresponding UNSW grade
#
# Before starting work on this task, make sure you set your tab-width to 8!
# It is also suggested to indent with tabs only.
#
# YOUR-NAME-HERE, DD/MM/YYYY

#![tabsize(8)]

main:
	la	$a0, prompt	# printf("Enter a mark: ");
	li	$v0, 4
	syscall

	li	$v0, 5		# scanf("%d", mark);
	syscall
    move $t0,$v0

    blt $t0, 50, f1
    blt $t0 ,65, f2
    blt $t0 ,75, f3
    blt $t0 ,85, f4
    j f5
f1:
    la	$a0, fl
  	li	$v0, 4
  	syscall
  	j end
f2:
    la	$a0, ps
  	li	$v0, 4
  	syscall
  	j end
f3:
    la	$a0, cr
  	li	$v0, 4
  	syscall
  	j end
f4:
    la	$a0, dn
  	li	$v0, 4
  	syscall
  	j end
f5:
    la	$a0, hd
  	li	$v0, 4
  	syscall
  	j end
end:
    li   $v0, 0
    jr   $ra          # return
	.data
prompt:
	.asciiz "Enter a mark: "
fl:
	.asciiz "FL\n"
ps:
	.asciiz "PS\n"
cr:
	.asciiz "CR\n"
dn:
	.asciiz "DN\n"
hd:
	.asciiz "HD\n"
