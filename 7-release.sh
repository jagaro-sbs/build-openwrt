#!/bin/sh

set -eu

mkdir -p release

ARCH="$(ls -1 openwrt/bin/packages)"

for APK_PATH in "openwrt/bin/packages/$ARCH/base/dnsmasq-"*.apk; do
  RELEASE_NAME="$(
    basename "$APK_PATH" |
      sed 's/^\(.*\)-\([2-9]\.[0-9].*\)$/\1-'"${OPENWRT_REVISION}-${ARCH}"'-\2/'
  )"
  cp "$APK_PATH" "release/$RELEASE_NAME"
done
