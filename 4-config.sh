#!/bin/sh

set -eu

cd openwrt
cp "../config-$OPENWRT_TARGET" .config
make defconfig
