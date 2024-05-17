# RPS2
## Overview
This repo contains tooling/examples/tests for the RPS2 Project (Rust for PlayStation 2).

Most of the work is actually being done in the [llvm-project fork](https://github.com/Tazdevil971/llvm-project-r5900/tree/dev-r5900)

## Paths
- `docs`: Contains project documentation.
- `repos`: Folder containing all sub-repos.
- `prefix`: Folder containing installation prefix for all built artifacts.
- `scripts`: Scripts and utils for managing builds and sub-repos.

## Quick start guide
In order to get everything to work you will need to run the following commands, in order, from the **root** of the repo.

- `./scripts/clone-all.sh`: Clones all of the required repos.
- `./scripts/setup-gcc.sh`: Will compile binutils and GCC so that you have a known good toolchain.
- `./scripts/setup-pcsx2.sh`: Downloads PCSX2 (PS2 Emulator) to a the prefix.
- `source ./scripts/rps2-utils.sh`: Includes all of the rps2 utilities into your terminal.

Once everything is set up, you can use the following commands from anywhere in the repo (these are included from `rps2-utils.sh`):
- `rps2_enter`/`rps2_exit`: They allow you to enter/exit from the prefix, allowing you to use all of the rps2 tools.
- `rps2_run`/`rps2_run_dbg`: Will run any executable through PCSX2 (dbg will open PCSX2 in debug mode and immediately stop it).
- `llvm_configure`: Will run cmake to configure LLVM.
- `llvm_build`: Will build and install the custom LLVM toolchain to the prefix.
- `llvm_test`/`llvm_unit_test`: Will run the LLVM regression tests and unit testst.