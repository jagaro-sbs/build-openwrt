#!/usr/bin/env bash

set -euo pipefail

VERSION="25.12.0-rc1"

REPO_URL="https://github.com/openwrt/openwrt.git"
REPO_TAG="v$VERSION"
BUILD_DIR="openwrt-$VERSION"

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
  build-essential clang flex bison g++ gawk \
  gcc-multilib g++-multilib gettext git libncurses5-dev libssl-dev \
  python3-setuptools rsync swig unzip zlib1g-dev file wget

#getent group build >/dev/null || groupadd build
#getent passwd build >/dev/null || useradd -s /bin/bash -g build -m build

git clone --branch "$REPO_TAG" "$REPO_URL" "$BUILD_DIR"
cd "$BUILD_DIR"

scripts/feeds update -a
scripts/feeds install -a

wget -O .config "https://downloads.openwrt.org/releases/$VERSION/targets/lantiq/xrx200/config.buildinfo"
cat >>.config <<EOF
CONFIG_DEFAULT_dnsmasq=y
CONFIG_PACKAGE_dnsmasq=y
CONFIG_PACKAGE_dnsmasq-dhcpv6=y
CONFIG_PACKAGE_dnsmasq-full=y
CONFIG_PACKAGE_dnsmasq_full_dhcp=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_dnsmasq_full_dnssec=y
CONFIG_PACKAGE_dnsmasq_full_auth=y
CONFIG_PACKAGE_dnsmasq_full_nftset=y
CONFIG_PACKAGE_dnsmasq_full_conntrack=y
CONFIG_PACKAGE_dnsmasq_full_noid=y
CONFIG_PACKAGE_dnsmasq_full_tftp=y
EOF

make defconfig download clean world -j$(($(nproc)+1))
