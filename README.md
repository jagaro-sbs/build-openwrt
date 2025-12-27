# Build OpenWRT

This repository builds the latest dnsmasq (2.92rc3) for various OpenWRT targets.

## Running locally

```sh
git clone https://github.com/jagaro-sbs/build-openwrt.git
cd build-openwrt

export OPENWRT_REVISION="v25.12.0-rc1"
export OPENWRT_TARGET="lantiq-xrx200"

./1-prerequisites.sh # needs sudo
./2-repository.sh
./3-download.sh
./4-toolchain.sh
./5-compile.sh
```

### `dnsmasq-full` dependencies

```
libc libubus20250102 libnettle8 libnetfilter-conntrack3 nftables-json
```

## References

- https://openwrt.org/docs/guide-developer/toolchain/use-buildsystem
- [https://openwrt.org/docs/guide-developer/toolchain/install-buildsystem?s[]=package#debianubuntumint](https://openwrt.org/docs/guide-developer/toolchain/install-buildsystem?s[]=package#debianubuntumint)
- https://openwrt.org/docs/guide-developer/toolchain/single.package
- https://thekelleys.org.uk/dnsmasq/release-candidates/
