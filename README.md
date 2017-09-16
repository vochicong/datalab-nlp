# NLP extension to Datalab

## Quick start

    cp .env.sample .env
    set -a; source .env; set +a
    docker-compose pull app
    docker-compose up app

## Packages included

- [Google Cloud Datalab](https://github.com/googledatalab/datalab) 
  with [many libraries](https://cloud.google.com/datalab/docs/concepts/key-concepts#included_libraries), 
  e.g. Jupyter, NLTK, NumPy, pandas, scikit-learn, SciPy etc.
- [MeCab](https://github.com/taku910/mecab)
- [gensim](https://github.com/RaRe-Technologies/gensim)
- [spaCy](https://github.com/explosion/spaCy)
- [Snorkel](https://github.com/HazyResearch/snorkel) (installed at `/content/snorkel`)

## Environment settings

Copy `.env.sample` to `.env` and edit it to define environment variables for Docker.

    cp .env.sample .env
    set -a; source .env; set +a

## Build 

    docker-compose build

You can set up Docker Hub and 
[GCR](https://console.cloud.google.com/gcr)
to build the image directly from your GitHub repository.

## Run locally

    docker-compose up app # start the container
    docker-compose exec app bash # enter container
    gcloud auth login # in container

## Push

    docker-compose push app # to Docker Hub

or

    docker tag $IMAGE_NAME:$IMAGE_TAG gcr.io/$PROJECT_ID/datalab-nlp:latest
    gcloud docker -- push gcr.io/$PROJECT_ID/datalab-nlp:latest

## Pull

    docker-compose pull app

or

    gcloud docker -- pull gcr.io/$PROJECT_ID/datalab-nlp

## Run on GCloud Datalab

From GCloud Shell, you should be able to run:

    datalab create nlp --image-name $IMAGE_NAME:$IMAGE_TAG

or

    datalab create nlp --image-name gcr.io/$PROJECT_ID/datalab-nlp:latest

## Links

- [Docker Hub](https://hub.docker.com/r/vochicong/datalab-nlp)
- [Travis CI](https://travis-ci.org/vochicong/datalab-nlp)

## Issues

- `Datalab`
  [can not pull a custom image](https://github.com/googledatalab/datalab/issues/1437) from GCR.

