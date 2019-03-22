#!/usr/bin/env bash
cd `dirname $0`

apt-get update -qy && apt-get install --no-install-recommends -qy \
build-essential python3-dev python3-pip git \
mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8 nkf \
net-tools

# # Python 2
# pip  install -q -U -r requirements.txt
# SPACY_DIR=`python -c "import os; import spacy; print(os.path.dirname(spacy.__file__))"`
# python -m pytest $SPACY_DIR/tests/ja/test_tokenizer.py

# Python 3
pip3 install -q -U -r requirements.txt
# SPACY_DIR3=`python3 -c "import os; import spacy; print(os.path.dirname(spacy.__file__))"`
# python3 -m pytest $SPACY_DIR3/tests/ja/test_tokenizer.py

./cleanup.sh
