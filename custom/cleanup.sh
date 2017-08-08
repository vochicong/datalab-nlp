#!/usr/bin/env bash
apt-get purge -y build-essential bzip2 cpp pkg-config libfreetype6-dev &&\
apt-get autoremove -y &&\
rm -rf /var/lib/apt/lists/* &&\
rm -rf /var/lib/dpkg/info/* &&\
rm -rf /tmp/* &&\
rm -rf /root/.cache/*
