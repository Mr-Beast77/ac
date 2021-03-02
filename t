#!/bin/bash
#apt update
#apt install -y -qq curl python
pwd
df -h
git --version
mkdir -p rom
cd rom
git clone https://github.com/Apon77/ppui -b aex --depth 1 device/xiaomi/mido || echo precloned
cd device/xiaomi/mido
pwd
#curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
