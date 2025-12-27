#!/bin/sh

set -eu

git clone "$OPENWRT_REPO_URL" openwrt
cd openwrt
git checkout "$OPENWRT_REVISION"
scripts/feeds update -a
scripts/feeds install -a
