# Erratas
Documentation of the various hardware errata and buggy features.

## Short loop errata
From the official manuals:
> Do not create a short loop of 6 steps or less that includes a branch instruction. In such a loop, a judgment whether to branch or not might be incorrect under special conditions. With the following loop, for example, if no hazards ("wait" cycles due to cache misses) occur to l0-a, l1-a, l0-b, and l1-b, it may end after executing once or twice.
>
> ```asm
> label: l0-a                // Instruction in l0 pipe
>        l1-a                // Instruction in l1 pipe
>        l0-b                // Instruction in l0 pipe
>        l1-b                // Instruction in l1 pipe
>        branch target=label // Branching to label address
>        l1-c                // Instruction in l1 pipe
> ```
>
> ### Concrete example
> ```asm
> addiu $a1,$a1,1
> addiu $v1,$v1,4
> addu $s0,$s0,$a1
> slti $v0,$a1,80
> bnez $v0,20 <c+0x20>
> sw $s0,0($v1)
> ```
> This restriction only apply to a loop that includes another branch instruction.

From GCC:
> On the R5900 short loops need to be fixed by inserting a NOP in the branch delay slot.
> The short loop bug under certain conditions causes loops to execute only once or twice.  We must ensure that the assembler never generates loops that satisfy all of the following conditions:
> - a loop consists of less than or equal to six instructions (including the branch delay slot);
> - a loop contains only one conditional branch instruction at the end of the loop;
> - a loop does not contain any other branch or jump instructions;
> - a branch delay slot of the loop is not NOP (EE 2.9 or later).
> 
> We need to do this because of a hardware bug in the R5900 chip.

Link to how GCC handles it: [binutils-gdb/gas/config/tc-mips.c:7154](https://github.com/ps2dev/binutils-gdb/blob/a2f80906bcb5cbc0d89c2e31f38ab122fd127132/gas/config/tc-mips.c#L7154)