#!/bin/sh
set -e

mkdir -p /var/lock/

echo "::group::Install packages"
opkg update
# opkg install wget-ssl ca-bundle
opkg install file
opkg install git git-http
echo "::endgroup::"

# . /etc/os-release
# wget -O /etc/opkg/keys/5283357d535bca85 https://hzyitc.github.io/emulator-openwrt/5283357d535bca85
# echo "src/gz emulator https://hzyitc.github.io/emulator-openwrt/$OPENWRT_ARCH" >>/etc/opkg/customfeeds.conf

cp /ci/5283357d535bca85 /etc/opkg/keys/
echo "src/gz emulator file:///ci" >>/etc/opkg/customfeeds.conf

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
