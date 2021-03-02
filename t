#!/bin/bash
apt update
apt install python -y
pwd
df -h
whoami
modprobe zram

curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -

