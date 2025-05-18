#!/bin/bash -e
# Utility to configure and build binutils/gcc
ROOT="${RPS2_ROOT:-$PWD}"

PREFIX=$ROOT/prefix
GCC_SRC=$ROOT/repos/gcc
BINUTILS_SRC=$ROOT/repos/binutils

TARGET=mips64r5900el-ps2-elf
NPROC="${NPROC:-$(nproc)}"

# Build binutils
mkdir $BINUTILS_SRC/build
(cd $BINUTILS_SRC/build
    $BINUTILS_SRC/configure \
        --prefix=$PREFIX \
        --target=$TARGET \
        --disable-nls \
        --disable-sim
        
    make -j$NPROC
    make -j$NPROC install)

# Build gcc
mkdir $GCC_SRC/build
(cd $GCC_SRC/build
    $GCC_SRC/configure \
        --prefix=$PREFIX \
        --target=$TARGET \
        --disable-nls \
        --enable-languages=c,c++ \
        --enable-checking=release \
        --with-float=hard \
        --without-headers \
        --without-newlib \
        --disable-libssp \
        --disable-multilib \
        --disable-tls
        
    make -j$NPROC
    make -j$NPROC install-strip)