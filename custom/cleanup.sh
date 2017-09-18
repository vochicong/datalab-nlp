#!/usr/bin/env bash
set -ex

apt-get purge -y build-essential cpp g++ pkg-config libfreetype6-dev
# apt-get purge -y unzip bzip2
apt-get autoremove -y
rm -rf /var/lib/apt/lists/*
rm -rf /var/lib/dpkg/info/*
rm -rf /tmp/*
rm -rf /root/.cache/*
rm -rf /root/download/*
