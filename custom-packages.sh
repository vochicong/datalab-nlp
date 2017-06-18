apt-get update -y && apt-get install --no-install-recommends -y -q \
  build-essential python3-dev python3-pip git \
  mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8 nkf \
  net-tools &&\

## MeCab
  # pip  install mecab-python &&\
  pip3 install mecab-python3 &&\

## gensim
  # pip  install Cython boto google-compute-engine gensim pattern &&\
  pip3 install Cython boto google-compute-engine gensim &&\

## spaCy
  # pip  install spacy &&\
  pip3 install spacy &&\

## Clean up
  apt-get purge -y build-essential bzip2 cpp pkg-config libfreetype6-dev &&\
  apt-get autoremove -y &&\
  rm -rf /var/lib/apt/lists/* &&\
  rm -rf /var/lib/dpkg/info/* &&\
  rm -rf /tmp/* &&\
  rm -rf /root/.cache/*
