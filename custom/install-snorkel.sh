#!/usr/bin/env bash
set -ex
cd /

git clone --branch docker --depth 1 https://github.com/vochicong/snorkel.git
cd snorkel
git submodule update --init --recursive

install/apt_pkgs.sh
install/corenlp.sh
install/conda.sh
install/python_pkgs.sh
install/cleanup.sh
