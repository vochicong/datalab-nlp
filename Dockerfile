# FROM gcr.io/cloud-datalab/datalab:latest
FROM gcr.io/cloud-datalab/datalab:commit-latest-master-build

WORKDIR /custom

COPY ./custom/cleanup.sh ./
COPY ./custom/install.sh ./
COPY ./custom/requirements.txt ./
RUN ./install.sh

COPY ./custom/entrypoint.sh ./
