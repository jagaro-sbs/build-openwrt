#!/bin/sh

set -eu

cd openwrt
patch -p1 <../dnsmasq-2.92rc3.patch
