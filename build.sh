#!/bin/sh

set -eu

export OPENWRT_REVISION="v25.12.0-rc1"
export OPENWRT_TARGETS="lantiq-xrx200"

export OPENWRT_TARGET

./1-prerequisites.sh # needs sudo
./2-clone.sh

for OPENWRT_TARGET in $OPENWRT_TARGETS; do
  make dirclean
  ./3-config.sh
  ./4-download.sh
  ./5-toolchain.sh
  ./6-compile.sh
  ./7-release.sh
done
