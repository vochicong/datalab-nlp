#!/usr/bin/env bash
set -ex

pip install -r /snorkel/python-package-requirement.txt

# Download spaCy English model
python -m spacy download en

jupyter nbextension enable --py widgetsnbextension --sys-prefix

# Use runipy to run Jupyter/IPython notebooks from command-line
pip install runipy

