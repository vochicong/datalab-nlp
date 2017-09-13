#!/usr/bin/env bash
set -ex
#cd `dirname $0`
#./install.sh
#pip3 install -q -U -r requirements.txt

exec bash -c "EXTERNAL_PORT=${EXTERNAL_PORT} /datalab/run.sh"
