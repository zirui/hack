#!/usr/bin/python
# encoding:utf8

import sys
reload(sys)
sys.setdefaultencoding('utf8')

from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'


@app.route('/haha')
def index():
    return '路漫漫其修远兮，吾将上下而求索'


if __name__ == '__main__':
    app.debug = True
    app.run()
