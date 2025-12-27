#!/bin/sh

set -eu

cd openwrt
cp "../configs/config-$OPENWRT_TARGET" .config
make defconfig
