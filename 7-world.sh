#!/bin/sh

set -eu

cd openwrt
make -j $(($(nproc)+1)) world V=s
