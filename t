#!/bin/bash
df -h
mkdir -p rom
cd rom
repo init --depth=1 -u git://github.com/AospExtended/manifest.git -b 11.x -g default,-device,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j 30 -q frameworks/base
