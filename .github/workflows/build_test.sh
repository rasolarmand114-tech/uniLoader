#!/bin/sh
#
# CI calls this script from the project root, as such we don't really
# need to care about changing the directory
#

set -e

devices=()
procs=$(nproc --all)
makeargs="CROSS_COMPILE=aarch64-linux-gnu- -j$procs"

echo "Using $procs cores for build."
make ARCH=arm64
make distclean $makeargs
make a12s_defconfig $makeargs
make $makeargs

echo "A12S build completed."
