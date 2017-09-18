#!/usr/bin/env bash
set -ex
#cd `dirname $0`
#./install.sh
#pip3 install -q -U -r requirements.txt

[ -e /content/snorkel ] || ln -s /snorkel /content/snorkel
[ -f /snorkel/set_env.sh ] && source /snorkel/set_env.sh

exec /datalab/run.sh
