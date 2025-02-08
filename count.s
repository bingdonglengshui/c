.data
prompt:     .asciiz "Enter a number: "  # 提示用户输入的数字
newline:    .asciiz "\n"                # 换行符

.text
.globl main

main:
    # 打印提示信息
    li $v0, 4              # 系统调用号 4: 打印字符串
    la $a0, prompt         # 加载提示信息的地址
    syscall

    # 读取用户输入的数字
    li $v0, 5              # 系统调用号 5: 读取整数
    syscall
    move $t0, $v0          # 将输入的数字保存到 $t0

    # 初始化计数器
    li $t1, 1              # $t1 = 1 (计数器)

loop:
    # 检查计数器是否超过输入的数字
    bgt $t1, $t0, end_loop # 如果 $t1 > $t0，跳出循环

    # 打印当前的数字
    li $v0, 1              # 系统调用号 1: 打印整数
    move $a0, $t1          # 将要打印的数字放入 $a0
    syscall

    # 打印换行符
    li $v0, 4              # 系统调用号 4: 打印字符串
    la $a0, newline        # 加载换行符的地址
    syscall

    # 增加计数器
    addi $t1, $t1, 1       # $t1 = $t1 + 1

    # 继续循环
    j loop

end_loop:
    # 程序结束
    li $v0, 10             # 系统调用号 10: 退出程序
    syscall