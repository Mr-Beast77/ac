#!/bin/bash
df -h
mkdir -p rom
cd rom
ls -lah
repo init --depth=1 -u git://github.com/AospExtended/manifest.git -b 11.x -g default,-device,-mips,-darwin,-notdefault

time repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j 30 platform_build_soong platform_device_aosp_sepolicy platform_device_qcom_sepolicy
rm -rf .repo
