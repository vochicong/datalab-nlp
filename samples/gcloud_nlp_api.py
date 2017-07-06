# coding: utf-8

from google.cloud import language
from google.cloud import storage
import six
import os
from tempfile import NamedTemporaryFile


def decode_utf(text):
    if isinstance(text, six.binary_type):
        text = text.decode('utf-8')

    return text


def doc_from_text(text):
    text = decode_utf(text)
    return language_client.document_from_text(text)


def doc_from_gcs(gcs_uri):
    return language_client.document_from_gcs_url(gcs_uri)


# https://cloud.google.com/storage/docs/reference/libraries
# https://github.com/GoogleCloudPlatform/python-docs-samples/blob/85d4b1c52de3b8749c139c63bd9f37fdd85da4c8/storage
# /cloud-client/snippets.py
# https://github.com/GoogleCloudPlatform/python-docs-samples/blob/master/language/cloud-client/v1/snippets.py
language_client = language.Client()


# https://cloud.google.com/natural-language/docs/basics#sentiment_analysis_response_fields
def sentiment_doc(document):
    """Detects sentiment in the document."""
    sentiment = document.analyze_sentiment().sentiment
    res = u'センチメント分析 Score: {}. Magnitude: {}'.format(sentiment.score, sentiment.magnitude)
    # print(res)
    return res


def entities_doc(document):
    """Detects entities in the text."""
    entities = document.analyze_entities().entities
    res = 'エンティティ分析\n'
    for entity in entities:
        res += (u'{:<16}: {}'.format('### name', entity.name) + '\n' +
                u'{:<16}: {}'.format('type', entity.entity_type) + '\n' +
                u'{:<16}: {}'.format('metadata', entity.metadata) + '\n' +
                u'{:<16}: {}'.format('salience', entity.salience) + '\n' +
                u'{:<16}: {}'.format('wikipedia_url', entity.metadata.get('wikipedia_url', '-'))) + '\n'
    # print(res)
    return res


def syntax_doc(document):
    """Detects syntax in the document."""
    syntax = document.analyze_syntax()
    res = '構文解析\n'
    for s in syntax.sentences:
        res += u'{}'.format(s.content) + '\n'
    for token in syntax.tokens:
        res += u'{}: {}'.format(token.part_of_speech.tag, token.text_content) + '\n'
    # print(res)
    return res


def nlp_doc(doc):
    res = ('=' * 60 + '\n' +
           syntax_doc(doc) +
           '=' * 20 + '\n' +
           sentiment_doc(doc) + '\n' +
           '=' * 20 + '\n' +
           entities_doc(doc))
    # print(res)
    return res


def nlp_text(text):
    doc = doc_from_text(text)
    return nlp_doc(doc)


# def nlp_gcs(bucket_name, blob_name):
#     gcs_uri = 'gs://' + bucket_name + '/' + blob_name
def nlp_gcs(gcs_uri):
    doc = doc_from_gcs(gcs_uri)
    return nlp_doc(doc)


def read_gcs(bucket_name, blob_name):
    gcs = storage.Client()
    bucket = gcs.get_bucket(bucket_name)
    f = NamedTemporaryFile()
    blob = bucket.blob(blob_name)
    blob.download_to_filename(f.name)
    print('Blob {} downloaded to {}.'.format(blob_name, f.name))
    text = f.read()
    f.close()
    return decode_utf(text)


def write_gcs(bucket_name, blob_name, data):
    gcs = storage.Client()
    bucket = gcs.get_bucket(bucket_name)
    blob = bucket.blob(blob_name)
    blob.upload_from_string(data)
    print('Blob {} uploaded by data\n{}.'.format(blob_name, data))
