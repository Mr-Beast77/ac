#!/bin/bash
df -h
mkdir -p rom
cd rom
python --version
python2 --version
python3 --version
ls -lah
time repo init --depth=1 -u git://github.com/AospExtended/manifest.git -b 11.x -g default,-device,-mips,-darwin,-notdefault
#time repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j 30 frameworks/base platform_vendor_aosp
ls -lah
rm -rf .repo
