#!/bin/sh

set -eu

cd openwrt

make -j $(($(nproc)+1)) V=s world
#make -j $(($(nproc)+1)) V=s package/network/services/dnsmasq/compile
