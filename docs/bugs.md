# Various bugs
## LLVM uses wrong feature set when parsing global ASM during `initializeRecordStreamer`

While running `initializeRecordStreamer` LLVM uses an empty feature set (and CPU) when parsing global ASM (as can be seen [here](https://github.com/Tazdevil971/llvm-project-r5900/blob/2e729bac35fb3e17c21a636f0fd076a8d7ee84d1/llvm/lib/Object/ModuleSymbolTable.cpp#L96)).

This causes a bug in which LLVM might not enable correct features while parsing global asm, in turn causing randoms "instruction requires a CPU feature not currently enabled".

This does not happen inside of normal functions, as those are tagged with the correct CPU beforehand, and LLVM respects that. No such equivalent exists for module level assembly.

This can be worked around in two ways:
- By disabling thin LTO (maybe even disabling LTO altogether?) (`-C lto=off`).
- By setting required features manually in the assembly block.

See [llvm-project#98673](https://github.com/llvm/llvm-project/pull/98673), [llvm-project#97685](https://github.com/llvm/llvm-project/pull/97685)