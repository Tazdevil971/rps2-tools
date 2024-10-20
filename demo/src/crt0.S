.text

# Default stack size for main is 64kb
.equ stack_size, (64 * 1024)

.globl __entry
.globl main
.globl __gp
.globl __heap_start
.globl __bss_end
.globl root_func

args:
    .space 1024, 0

__entry:
    # sync 0x10
    
    # Clear out .bss
    la $t0, __heap_start
    la $t1, __bss_end
clear_bss:
    # FIXME: sq is not yet supported
    # sq $zero, 0($v0)
    # addiu $v0, $v0, 0x10
    # sltu $t2, $v0, $v1
    # bne $t2, $zero, clear_bss

    sd $zero, 0($v0)
    addiu $v0, $v0, 0x8
    sltu $t2, $v0, $v1
    bne $t2, $zero, clear_bss

    # Initialize stack
    la $a0, __gp
    move $gp, $a0
    li $a1, -1
    li $a2, stack_size
    la $a3, args
    la $t0, root_func
    li $v1, 0x3c
    syscall
    move $sp, $v0

    # Jump directly to main
    jal main

    # main is not supposed to return