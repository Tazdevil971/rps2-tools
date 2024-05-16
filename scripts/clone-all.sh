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

fast_clone $ROOT/repos/gcc $GCC_URL $GCC_HASH
fast_clone $ROOT/repos/binutils $BINUTILS_URL $BINUTILS_HASH

git clone -b $LLVM_BRANCH $LLVM_URL $ROOT/repos/llvm