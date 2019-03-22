#!/usr/bin/env bash
set -ex

if [ ! -e /snorkel ]
then
  git clone --branch docker --depth 1 https://github.com/vochicong/snorkel.git /snorkel
  cd /snorkel
  git submodule update --init --recursive 
fi

cd /custom/snorkel
./apt_pkgs.sh

cd /snorkel
/custom/snorkel/corenlp.sh

cd /custom/snorkel

# ./conda.sh

# For Python 2
./python_pkgs.sh
../install-janome.sh

# For Python 3
# apt-get update -qy && apt-get install -qy python3-tk
# alias pip=pip3
# alias python=python3
# install/python_pkgs.sh
# ../install-janome.sh

./cleanup.sh
