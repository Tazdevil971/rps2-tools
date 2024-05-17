.text

.equ stack_size, (128 * 1024)

.globl main
.globl __entry
.globl __gp
.globl ExitThread

args:
    .space 1024, 0

__entry:
    # Initialize stack
    la $a0, __gp
    move $gp, $a0
    li $a1, -1
    li $a2, stack_size
    la $a3, args
    la $t0, ExitThread
    li $v1, 0x3c
    syscall
    move $sp, $v0

    # Jump directly to main
    jal main

    # TODO: Clean shutdown?