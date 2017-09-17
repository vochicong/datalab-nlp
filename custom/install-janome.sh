#!/usr/bin/env bash
set -ex
cd /snorkel

source install/miniconda_env.sh
pip install janome pytest
SPACY_DIR=`python -c "import os; import spacy; print(os.path.dirname(spacy.__file__))"`
pytest $SPACY_DIR/tests/ja/test_tokenizer.py

install/cleanup.sh
