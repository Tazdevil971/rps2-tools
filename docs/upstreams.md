# Upstreamed patches
This document tracks upstreamed patches coming from this project.

## Bugfixes
### compiler-builtins/692 Fixed `__divtf3` having wrong cfg for f128
Status: merged

[Link](https://github.com/rust-lang/compiler-builtins/pull/692)

### rust/XXX Fix symbols.o creation for N32 Mips targets
Status: todo

Depends: object/743

### llvm-project/116569 [MIPS] Updated MIPS N calling conventions so that fp16 arguments no longer cause a crash 
Status: merged

[Link](https://github.com/llvm/llvm-project/pull/116569)

### llvm-project/XXX Fix single-float in Mips backend
Status: todo

## Improvements
### gimli/749 arch: added missing MIPS HI/LO register defs
Status: merged

[Link](https://github.com/gimli-rs/gimli/pull/749)

### object/743 Add Mips64 N32 ABI
Status: merged

[Link](https://github.com/gimli-rs/object/pull/743)

### unwinding/XXX Add support for ILP32 targets
Status: todo

### unwinding/XXX ADd support for Mips targets
Status: todo

### rust/XXX Add extra target_features for Mips
Status: todo

### llvm-project/XXX Add r5900 support to Mips backend
Status: maybe one day...