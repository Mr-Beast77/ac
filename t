#!/bin/bash
apt update
apt install -y -qq curl python
pwd
df -h
whoami
curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
