#!/bin/bash -e
# Various functions to be used in the repo
ROOT="${ROOT:-$PWD}"

PREFIX=$ROOT/prefix
LLVM_SRC=$ROOT/repos/llvm

PCSX2_VERSION=$(cat $ROOT/scripts/pcsx2.version)
PCSX2_EXE="pcsx2-$PCSX2_VERSION-linux-appimage-x64-Qt.AppImage"

NPROC="${NPROC:-$(nproc)}"

# Setup the RPS2 environment
rps2_enter () {
    OLD_PATH=$PATH

    PATH="$PREFIX/bin:$PATH"
}

rps2_exit () {
    PATH=$OLD_PATH
}

rps2_run () {
    local elf=$1
    # Canonicalize the path, as PCSX2 is a bit stupid
    $PREFIX/bin/$PCSX2_EXE -batch -- $(realpath $elf)
}

rps2_run_dbg () {
    local elf=$1
    # Canonicalize the path, as PCSX2 is a bit stupid
    $PREFIX/bin/$PCSX2_EXE -batch -debugger -- $(realpath $elf)
}

# Utilities to work with the LLVM repo

# Re-configure LLVM
llvm_configure () {
    (cd $LLVM_SRC/llvm
        cmake \
            -B$LLVM_SRC/build \
            -GNinja \
            -DCMAKE_INSTALL_PREFIX=$PREFIX \
            -DCMAKE_C_COMPILER=clang \
            -DCMAKE_CXX_COMPILER=clang++ \
            -DCMAKE_BUILD_TYPE=Release \
            -DLLVM_USE_LINKER=lld \
            -DLLVM_ENABLE_ASSERTIONS=On \
            -DLLVM_PARALLEL_COMPILE_JOBS=$NPROC \
            -DLLVM_PARALLEL_TABLEGEN_JOBS=$NPROC \
            -DLLVM_PARALLEL_LINK_JOBS=1 \
            -DLLVM_ENABLE_PROJECTS="mlir;clang;llvm" \
            -DLLVM_TARGETS_TO_BUILD="X86;Mips" \
            -DLLVM_CCACHE_BUILD=On \
            -DLLVM_OPTIMIZED_TABLEGEN=On)
}

# Build and install LLVM
llvm_build () {
    cmake --build $LLVM_SRC/build
    cmake --build $LLVM_SRC/build --target install > /dev/null
}

# Run regression test suite
llvm_test () {
    cmake --build $LLVM_SRC/build --target check-llvm
}

# Run LLVM unit tests
llvm_unit_test () {
    cmake --build $LLVM_SRC/build --target check-llvm-unit
}