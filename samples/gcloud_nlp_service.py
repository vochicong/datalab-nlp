# coding: utf-8
# https://falconframework.org/
# https://github.com/explosion/spacy-services/blob/master/sense2vec/app.py
import falcon
from wsgiref import simple_server
from gcloud_nlp_api import nlp_text


class GcloudNlpResource(object):
    """test with:
    curl -s localhost:8000/nlp -d '台風３号による突風で、住宅の瓦が飛ばされるなどの被害が出た埼玉県草加市で、市と気象台が現地調査を行った結果、被害は合わせて２２件に上ることが確認されました。'
    """

    def on_post(self, req, resp):

        text = req.stream.read()

        try:
            resp.body = nlp_text(text)
            resp.content_type = 'text/string'
            resp.append_header('Access-Control-Allow-Origin', "*")
            resp.status = falcon.HTTP_200
        except Exception as e:
            resp.status = falcon.HTTP_500
            raise falcon.HTTPBadRequest(
                    'GCloud NL API failed',
                    '{}'.format(e))

def main():
    APP = falcon.API()
    APP.add_route('/nlp', GcloudNlpResource())

    httpd = simple_server.make_server('0.0.0.0', 8000, APP)
    httpd.serve_forever()

if __name__ == '__main__':
    main()
