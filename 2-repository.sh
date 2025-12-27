#!/bin/sh

set -eu

OPENWRT_REPO_URL="https://github.com/openwrt/openwrt.git"

git clone "$OPENWRT_REPO_URL" openwrt
cd openwrt

git checkout "$OPENWRT_REVISION"

scripts/feeds update -a
scripts/feeds install -a

for PATCH_PATH in ../patches/*; do
  patch -p1 <"$PATCH_PATH"
done

cp "../configs/config-$OPENWRT_TARGET" .config

make defconfig
