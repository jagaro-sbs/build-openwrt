#!/bin/sh

set -eu

cd openwrt
for PATCH_PATH in ../patches/*; do
  patch -p1 <"$PATCH_PATH"
done
