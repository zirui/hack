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
from fabric import *


def is_chinese(uchar):
        if u'\u4e00' <= uchar <= u'\u9fa5':
            return True
        return False


def align_str(ustr, width, align='left'):
    """ align text
    default: align left
    """
    if not isinstance(ustr, unicode):
        ustr = unicode(ustr)
    count = 0
    for c in ustr:
        if is_chinese(c):
            count += 1
    if align == 'left':
        result = ustr + ' ' * (width - len(ustr) - count)
    elif align == 'right':
        result = ' ' * (width - len(ustr) - count) + ustr
    return result


def pprint_table(rows, align='left', fs=sys.stdout):
    """ prints out a table using the data in `rows`, which is assumed to be a
        sequence of sequences with the 0th element being the header
    """
    # figure out max column widths
    widths = [len(max(map(lambda x:str(x), cols), key=len)) for cols in zip(*rows)]

    # print the header
    header, data = rows[0], rows[1:]
    print >> fs, ' | '.join(align_str(title, width, align) for width, title in zip(widths, header))

    # print the separator
    print >> fs, '-+-'.join('-' * width for width in widths)

    # print the data
    for row in data:
        print >>fs, " | ".join(align_str(col, width, align) for width, col in zip(widths, row))


def get_arguments():
    '''get arugments
    '''
    parser = ArgumentParser("Strategy Driver")
    parser.add_argument("--host", '-H', dest='host', help='remote host ip')
    parser.add_argument("--ip", dest='host', help='remote host ip')
    parser.add_argument("--key", '-k', dest='key', help='host key')
    parser.add_argument("--list", '-l', dest='list_info', action='store_true', help='list host')
    return parser.parse_args()


#env.hosts = ['userX@serverX']
def copy():
    # make sure the directory is there!
    run('mkdir -p /home/userX/mynewfolder')

    # our local 'localdirectory' (it may contain files or subdirectories)
    put('localdirectory', '/home/userX/mynewfolder')


class HostJumper:
    def __init__(self):
        self.conf = conf

    def add_host(self, ip, key, name):
        pass

    def show_host(self):
        data = []
        header = ['host_key', 'org_key', 'org_name', 'hostname', 'ip']
        data.append(header)
        for r in self.conf:
            data.append([r[k] for k in 'host_key', 'org_key', 'org_name', 'hostname', 'ip'])
        pprint_table(data)

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
