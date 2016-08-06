#!/usr/bin/python
# coding:utf8

# Description: host configuration
# Author: zirui

import sys
reload(sys)
sys.setdefaultencoding('utf-8')

import logging
import time
import os.path
import subprocess
import json
from argparse import ArgumentParser
from conf import conf


def get_arguments():
    '''get arugments
    '''
    parser = ArgumentParser("Strategy Driver")
    parser.add_argument("--host", dest='host', help='remote host ip')
    parser.add_argument("--ip", dest='host', help='remote host ip')
    parser.add_argument("--key", '-k', dest='key', help='host key')
    parser.add_argument("--list", '-l', dest='list_info', action='store_true', help='list host')
    return parser.parse_args()


class HostJumper:
    def __init__(self):
        self.conf = conf

    def add_host(self, ip, key, name):
        pass

    def show_host(self):
        for r in self.conf:
            print json.dumps(r, ensure_ascii=False, indent=4)

    def _update(self):
        pass


def show_host():
    for r in conf:
        print json.dumps(r, ensure_ascii=False, indent=4)


def login(args):
    jumper = HostJumper()
    if args.list_info:
        jumper.show_host()


def main():
    args = get_arguments()
    login(args)


if __name__ == '__main__':
    main()
