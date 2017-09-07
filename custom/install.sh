#!/usr/bin/env bash
cd `dirname $0`

apt-get update -qy && apt-get install --no-install-recommends -qy \
build-essential python3-dev python3-pip git \
mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8 nkf \
net-tools &&\

pip3 install -q -U -r requirements.txt

apt-get purge -y build-essential bzip2 cpp pkg-config libfreetype6-dev &&\
apt-get autoremove -y &&\
rm -rf /var/lib/apt/lists/* &&\
rm -rf /var/lib/dpkg/info/* &&\
rm -rf /tmp/* &&\
rm -rf /root/.cache/*
