#!/usr/bin/env bash
apt-get update -y && apt-get install --no-install-recommends -y -q \
build-essential python3-dev python3-pip git \
mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8 nkf \
net-tools &&\

pip3 install -U -r custom-packages-requirements.txt
