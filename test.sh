#!/bin/sh
set -e

mkdir -p /var/lock/

echo "::group::Install packages"
opkg update
# opkg install wget-ssl ca-bundle
opkg install file
opkg install git git-http
echo "::endgroup::"

# Install key
opkg-key add /ci/emulator-openwrt.key.pub

# Install feed
. /etc/os-release
MAJOR_VERSION="$(echo "${VERSION_ID}" | grep -oE '[0-9]+\.[0-9]+' || echo "snapshot")"
echo "src/gz emulator file:///ci/${MAJOR_VERSION}-${OPENWRT_ARCH}/" >>/etc/opkg/customfeeds.conf

echo "::group::Install python3-androidnativeemu"
opkg update
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
