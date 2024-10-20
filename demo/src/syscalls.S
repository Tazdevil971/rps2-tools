.text

.macro define_syscall name num
.globl \name
\name:
    li $v1, \num
    syscall
    jr $ra
.endm

define_syscall ResetEE, 0x01;
define_syscall SetGsCrt, 0x02;
define_syscall Exit, 0x04;
define_syscall ExitThread, 0x23;
define_syscall InitHeap, 0x3d;
define_syscall FlushCache, 0x64;
define_syscall GsGetIMR, 0x70;
define_syscall GsPutIMR, 0x71;
define_syscall Deci2Call, 0x7c;