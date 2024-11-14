#!/usr/bin/env bash
# Various functions to be used in the repo
export RPS2_ROOT="${RPS2_ROOT:-$PWD}"

export RPS2_PREFIX=$RPS2_ROOT/prefix
export RPS2_LLVM_SRC=$RPS2_ROOT/repos/llvm
export RPS2_RUST_SRC=$RPS2_ROOT/repos/rust

export PCSX2_VERSION=$(cat $RPS2_ROOT/scripts/pcsx2.version)
export PCSX2_EXE="pcsx2-$PCSX2_VERSION-linux-appimage-x64-Qt.AppImage"

RPS2_NPROC="${RPS2_NPROC:-$(nproc)}"
PYTHON="/bin/python3"

# Setup the RPS2 environment
rps2_enter () {
    RPS2_OLD_PATH=$PATH

    PATH="$RPS2_PREFIX/bin:$PATH"
}

rps2_exit () {
    PATH=$RPS2_OLD_PATH
}

rps2_run () {
    local elf=$1
    # Canonicalize the path, as PCSX2 is a bit stupid
    $RPS2_PREFIX/bin/$PCSX2_EXE -batch -- $(realpath $elf)
}

rps2_run_dbg () {
    local elf=$1
    # Canonicalize the path, as PCSX2 is a bit stupid
    $RPS2_PREFIX/bin/$PCSX2_EXE -batch -debugger -- $(realpath $elf)
}

# Utilities to work with the LLVM repo

# Re-configure LLVM
llvm_configure () {
    (cd $RPS2_LLVM_SRC/llvm
        cmake \
            -B$RPS2_LLVM_SRC/build \
            -GNinja \
            -DCMAKE_INSTALL_PREFIX=$RPS2_PREFIX \
            -DCMAKE_C_COMPILER=clang \
            -DCMAKE_CXX_COMPILER=clang++ \
            -DCMAKE_BUILD_TYPE=Release \
            -DLLVM_USE_LINKER=lld \
            -DLLVM_ENABLE_ASSERTIONS=On \
            -DLLVM_PARALLEL_COMPILE_JOBS=$RPS2_NPROC \
            -DLLVM_PARALLEL_TABLEGEN_JOBS=$RPS2_NPROC \
            -DLLVM_PARALLEL_LINK_JOBS=1 \
            -DLLVM_ENABLE_PROJECTS="mlir;clang;lld;llvm" \
            -DLLVM_TARGETS_TO_BUILD="X86;Mips" \
            -DLLVM_CCACHE_BUILD=On \
            -DLLVM_OPTIMIZED_TABLEGEN=On)
}

# Build and install LLVM
llvm_build () {
    cmake --build $RPS2_LLVM_SRC/build
    cmake --build $RPS2_LLVM_SRC/build --target install > /dev/null
}

# Run regression test suite
llvm_test () {
    cmake --build $RPS2_LLVM_SRC/build --target check-llvm
}

# Run LLVM unit tests
llvm_unit_test () {
    cmake --build $RPS2_LLVM_SRC/build --target check-llvm-unit
}

# Run a specific LLVM lit test
llvm_run_lit_test () {
    local path=$1
    $PYTHON $RPS2_LLVM_SRC/build/bin/llvm-lit -v $path
}

# Apply patches to rust
rust_patch () {
    (cd $RPS2_RUST_SRC
        git apply $RPS2_ROOT/patches/rust-*)
}

# Re-configure rust
rust_configure () {
    (cd $RPS2_RUST_SRC
        rm config.toml 2> /dev/null || true
        ./configure \
            --enable-ccache \
            --llvm-root=$RPS2_LLVM_SRC/build \
            --codegen-backends=llvm \
            --enable-lld \
            --prefix=$RPS2_PREFIX \
            --sysconfdir=etc \
            --bindir=bin \
            --libdir=lib \
            --tools=rustfmt,rustdoc,clippy,rust-analyzer-proc-macro-srv \
            --enable-extended)
}

# Re-configure rust with minimal settings
rust_configure_minimal () {
    (cd $RPS2_RUST_SRC
        rm config.toml 2> /dev/null || true
        ./configure \
            --enable-ccache \
            --llvm-root=$RPS2_LLVM_SRC/build \
            --codegen-backends=llvm \
            --enable-lld \
            --prefix=$RPS2_PREFIX \
            --sysconfdir=etc \
            --bindir=bin \
            --libdir=lib)
}

# Build and install custom rust toolchain
rust_build () {
    (cd $RPS2_RUST_SRC
        ./x.py build library rustfmt rustdoc clippy proc-macro-srv-cli
        rustup toolchain link rps2-stage2 \
            $RPS2_RUST_SRC/build/host/stage2
        rustup toolchain link rps2-stage1 \
            $RPS2_RUST_SRC/build/host/stage1)
}

# Build and install custom rust toolchain with minimal settings
rust_build_minimal () {
    (cd $RPS2_RUST_SRC
        ./x.py build --stage 1 library
        rustup toolchain link rps2-stage1 \
            $RPS2_RUST_SRC/build/host/stage1)
}