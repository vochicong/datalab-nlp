## For Python 2
# FROM gcr.io/cloud-datalab/datalab:latest
## For Python 3
FROM gcr.io/cloud-datalab/datalab:commit-latest-master-build

MAINTAINER Cong Vo <kongvc@gmail.com>

# COPY . /datalab-nlp

RUN apt-get update -y && \
    apt-get install --no-install-recommends -y -q --allow-unauthenticated \
        build-essential python3-dev git \
        mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8 &&\

# Install MeCab
    # pip install mecab-python &&\
    pip3 install mecab-python3 &&\

# Install Gensim
    # pip install Cython boto google-compute-engine pattern gensim &&\
    pip3 install Cython boto google-compute-engine gensim &&\

# Install spaCy
    # pip install spacy pytest &&\
    pip3 install spacy pytest &&\

# Clean up
    apt-get purge -y build-essential bzip2 cpp pkg-config libfreetype6-dev &&\
    apt-get autoremove -y &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/lib/dpkg/info/* &&\
    rm -rf /tmp/* &&\
    rm -rf /root/.cache/*
