# emulator-openwrt

AndroidNativeEmu for openwrt

## Packages

- [unicorn](https://github.com/unicorn-engine/unicorn)
- [keystone](https://github.com/keystone-engine/keystone)
- [python3-AndroidNativeEmu](https://github.com/AeonLucid/AndroidNativeEmu)
- [python3-hexdump](https://pypi.org/project/hexdump/)
- [python3-pyelftools](https://github.com/eliben/pyelftools)

## How to Use

```shell
. /etc/os-release
MAJOR_VERSION="$(echo "${VERSION_ID}" | grep -oE '[0-9]+\.[0-9]+' || echo "snapshot")"
wget -O /etc/opkg/keys/5283357d535bca85 https://hzyitc.github.io/emulator-openwrt/5283357d535bca85
echo "src/gz emulator https://hzyitc.github.io/emulator-openwrt/${MAJOR_VERSION}/${OPENWRT_ARCH}" >>/etc/opkg/customfeeds.conf
```
