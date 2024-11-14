# Rust patches
Getting rust to cooperate with the LLVM fork shouldn't require any special modification to the rust compiler itself.

That said some very minor modifications are required, here is a list.

## rust-fix_symbols_o
Required due to the wack symbols.o that rust uses to properly export archive symbols. The logic responsible for this is messy (located in [`create_object_file`](https://github.com/rust-lang/rust/blob/9b00956e56009bab2aa15d7bff10916599e3d6d6/compiler/rustc_codegen_ssa/src/back/metadata.rs#L180)) and doesn't properly work all the times so we patch around it and hardcode some sensible values.

This patch is extra painful because there is no easy way to properly fix this, here are the steps required:
- ~~Patch the `object` crate, as it currently doesn't properly support Mips64/n32 targets, already done [here](https://github.com/Tazdevil971/object/tree/mips64-n32), needs upstreaming.~~ Working on it
- ~~Updating the whole `rustc_codegen_ssa` to `object` 0.36.0, there where some breaking changes between 0.32.0 and 0.36.0.~~ Already done upstream
- Properly patching `create_object_file` in order to support n32 targets.
- Finally adding the `r5900` to the known CPUs (practically impossible to upstream as it requires the LLVM patch to work).

## rust-add_extra_mips_features
Adds extra features to rust `cfg`. This allows code to detect soft-float and single-float mips configurations.

This was enabled by [rust/129884](https://github.com/rust-lang/rust/pull/129884), which allows for ABI breaking features to be correctly detected, but not enabled.