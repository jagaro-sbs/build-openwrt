#!/bin/sh

set -eu
cd "$(dirname "$0")"

OPENWRT_REPO_URL="https://github.com/openwrt/openwrt.git"
OPENWRT_REVISION="v25.12.0-rc1"
OPENWRT_TARGET="lantiq-xrx200"

./1-prerequisites.sh
./2-repository.sh
./3-patch.sh
./4-config.sh
./5-download.sh
./6-toolchain.sh
./7-world.sh
