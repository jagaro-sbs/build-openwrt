#!/bin/sh

set -eu

OPENWRT_REPO_URL="https://github.com/openwrt/openwrt.git"

test -d .openwrt || git clone "$OPENWRT_REPO_URL" .openwrt
( cd .openwrt && git pull )

rm -rf openwrt
git clone .openwrt openwrt
cd openwrt

git checkout "$OPENWRT_REVISION"

scripts/feeds update -a
scripts/feeds install -a

for PATCH_PATH in ../patches/$OPENWRT_REVISION/*; do
  patch -p1 <"$PATCH_PATH"
done
