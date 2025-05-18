#!/bin/bash -e
# Utility to download and install PCSX2
ROOT="${RPS2_ROOT:-$PWD}"

PREFIX=$ROOT/prefix

PCSX2_VERSION=$(cat $ROOT/scripts/pcsx2.version)
PCSX2_EXE="pcsx2-$PCSX2_VERSION-linux-appimage-x64-Qt.AppImage"
PCSX2_URL="https://github.com/PCSX2/pcsx2/releases/download/$PCSX2_VERSION/$PCSX2_EXE"

# Create bin directory in prefix if it does not exist
mkdir $PREFIX/bin 2> /dev/null || true

# Download the binary from github
(cd $PREFIX/bin
    wget $PCSX2_URL
    chmod +x $PCSX2_EXE)