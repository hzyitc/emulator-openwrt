#!/bin/sh
set -e

mkdir -p /var/lock/

echo "::group::Install packages"
opkg update || true
opkg install wget-ssl ca-bundle # For openwrt-19.07
opkg install file
opkg install git git-http
opkg install python3-xml
echo "::endgroup::"

# Install key
opkg-key add /ci/emulator-openwrt.key.pub

# Install feed
. /etc/os-release
DIST="$(echo "openwrt-${VERSION_ID}" | grep -oE 'openwrt-[0-9]+\.[0-9]+' || echo "snapshot")"
echo "src/gz emulator file:///ci/${DIST}-${OPENWRT_ARCH}/" >>/etc/opkg/customfeeds.conf

echo "::group::Install python3-androidnativeemu"
opkg update || true
opkg install python3-androidnativeemu
echo "::endgroup::"

echo "::group::Clone"
git clone https://github.com/AeonLucid/AndroidNativeEmu
echo "::endgroup::"

cd AndroidNativeEmu/examples

for file in $(ls example_*.py); do
    echo "::group::Run $file"
    python3 "$file"
    echo "::endgroup::"
done
