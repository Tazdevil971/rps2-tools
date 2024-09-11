#!/bin/bash -e
# Tool to clone all repos to a known location
ROOT="${ROOT:-$PWD}"

# RPS2 project llvm forks
LLVM_URL="git@github.com:Tazdevil971/llvm-project-r5900.git"
LLVM_BRANCH="dev-r5900"

# ps2dev provided binutils/gcc updated repos
BINUTILS_URL="https://github.com/ps2dev/binutils-gdb.git"
BINUTILS_HASH="a2f80906bcb5cbc0d89c2e31f38ab122fd127132"
GCC_URL="https://github.com/ps2dev/gcc.git"
GCC_HASH="98394900186c29807e6e4de91aaf3b429a0a81f2"
RUST_URL="https://github.com/rust-lang/rust.git"
RUST_HASH="9b00956e56009bab2aa15d7bff10916599e3d6d6"
DSNET_URL="https://github.com/ps2dbg/dsnet.git"
DSNET_HASH="5b268fe38a3d6c41b225ff5acb7e86e855c4e7e0"

# Utility to speedily clone large repos 
fast_clone () {
    local dir=$1
    local url=$2
    local hash=$3

    mkdir $dir
    (cd $dir
        git init --quiet
        git remote add origin $url
        git fetch --depth=1 origin $hash
        git checkout --quiet $hash)
}

# Do a shallow fast clone for repose we don't need to actively work on
[ ! -d $ROOT/repos/gcc ] && fast_clone $ROOT/repos/gcc $GCC_URL $GCC_HASH
[ ! -d $ROOT/repos/binutils ] && fast_clone $ROOT/repos/binutils $BINUTILS_URL $BINUTILS_HASH
[ ! -d $ROOT/repos/rust ] && fast_clone $ROOT/repos/rust $RUST_URL $RUST_HASH
[ ! -d $ROOT/repos/dsnet ] && fast_clone $ROOT/repos/dsnet $DSNET_URL $DSNET_HASH

# Do a normal clone for repos with actual meaningful history
[ ! -d $ROOT/repos/llvm ] && git clone -b $LLVM_BRANCH $LLVM_URL $ROOT/repos/llvm