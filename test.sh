#!/bin/sh

mkdir -p /var/lock/

wget -O /etc/opkg/keys/5283357d535bca85 https://hzyitc.github.io/emulator-openwrt/5283357d535bca85
echo "src/gz emulator file:///ci" >>/etc/opkg/customfeeds.conf

echo "::group::Update"
opkg update
echo "::endgroup::"

echo "::group::Install python3-androidnativeemu"
opkg install python3-androidnativeemu
echo "::endgroup::"

echo "::group::Install git"
opkg install git git-http
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
