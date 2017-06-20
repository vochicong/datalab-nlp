#!/usr/bin/env bash
apt-get update -y && apt-get install --no-install-recommends -y -q \
build-essential python3-dev python3-pip git \
mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8 nkf \
net-tools &&\

## MeCab
pip3 install mecab-python3 &&\

## gensim
pip3 install Cython boto google-compute-engine gensim &&\

## spaCy
pip3 install spacy
