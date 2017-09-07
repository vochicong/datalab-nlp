#!/usr/bin/env bash
set -ex
cd `dirname $0`

git clone --branch docker --depth 1 https://github.com/vochicong/snorkel.git
cd snorkel
git submodule update --init --recursive
source docker/install.sh

apt-get update -qy
apt-get install --no-install-recommends -qy \
 g++

install_python_pkgs
install_corenlp
cleanup
