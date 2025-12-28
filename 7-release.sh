#!/bin/sh

set -eu

mkdir -p release

ARCH="$(ls -1 openwrt/bin/packages)"

for PACKAGE_PATH in "openwrt/bin/packages/$ARCH/base/dnsmasq-"*; do
  RELEASE_NAME="$(
    basename "$PACKAGE_PATH" |
      sed 's/^\(.*\)-\([2-9]\.[0-9].*\)$/\1-'"${OPENWRT_REVISION}-${ARCH}"'-\2/'
  )"
  cp "$PACKAGE_PATH" "release/$RELEASE_NAME"
done
