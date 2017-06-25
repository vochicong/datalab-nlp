# NLP extension to Datalab

## Packages included:

- [Google Cloud Datalab](https://github.com/googledatalab/datalab) with [many libraries](https://cloud.google.com/datalab/docs/concepts/key-concepts#included_libraries), e.g. Jupyter, NLTK, NumPy, pandas, scikit-learn, SciPy etc.
- [MeCab](https://github.com/taku910/mecab)
- [gensim](https://github.com/RaRe-Technologies/gensim)
- [spaCy](https://github.com/explosion/spaCy)

## Build on local

    export PROJECT_ID=[GCP project ID]
    docker-composer build

## Run locally

    docker-composer up # start the container
    docker-compose exec datalab-nlp bash # enter container
    gcloud auth login # in container

## [GCR](https://console.cloud.google.com/gcr)

To push the image to GCR:

    docker tag vochicong/datalab-nlp:latest gcr.io/$PROJECT_ID/datalab-nlp:latest
    gcloud docker -- push gcr.io/$PROJECT_ID/datalab-nlp:latest

To pull the image from GCR:

    gcloud docker -- pull gcr.io/$PROJECT_ID/datalab-nlp

You can set up GCR to build the image directly from a Git repository.

## Run on GCloud Datalab

From GCloud Shell, you should be able to run:

    datalab create nlp --image-name gcr.io/$PROJECT_ID/datalab-nlp:latest

Unfortunately, it seems that currently the VM created by `datalab create`
[can not pull modified images](https://github.com/googledatalab/datalab/issues/1437) from GCR.
Use public Docker Hub to work arround, e.g.:

    # On local
    docker push vochicong/datalab-nlp:latest

    # from GCloud Shell
    datalab create nlp --image-name vochicong/datalab-nlp:latest

## Travis CI

Docker image `vochicong/datalab-nlp` is automatically built and pushed by Travis CI.
