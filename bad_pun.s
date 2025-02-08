# read a mark and print the corresponding UNSW grade
#
# Before starting work on this task, make sure you set your tab-width to 8!
# It is also suggested to indent with tabs only.
#
# YOUR-NAME-HERE, DD/MM/YYYY

#![tabsize(8)]
	.data
prompt:
	.asciiz "Well, this was a MIPStake!\n"
newline:
    .asciiz "\n"
   .text
   .globl main
main:
	la	$a0, prompt
	li	$v0, 4
	syscall
    li $v0, 4              # 系统调用号 4: 打印字符串
    la $a0, newline        # 加载换行符的地址
    syscall
	li	$v0, 0
	jr	$ra		# return 0


