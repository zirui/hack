#!/usr/bin/python
# coding:utf8

# Description: util for remote host login
# Author: zirui
# TODO:
# 1. support add host interactively
# 2. support one command installation
# 3. add fuzzy key match support


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
#from fabric import *


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



#env.hosts = ['userX@serverX']
def copy():
    # make sure the directory is there!
    run('mkdir -p /home/userX/mynewfolder')

    # our local 'localdirectory' (it may contain files or subdirectories)
    put('localdirectory', '/home/userX/mynewfolder')


class HostJumper:
    def __init__(self):
        self.conf = conf
        self.keys_conf = {}
        self.init_keys()

    def init_keys(self):
        for r in self.conf:
            self.keys_conf[r['host_key']] = r

    def add_host(self, ip, key, name):
        pass

    def show_host(self):
        data = []
        header = ['host_key', 'org_key', 'org_name', 'hostname', 'ip']
        data.append(header)
        for r in self.conf:
            data.append([r[k] for k in 'host_key', 'org_key', 'org_name', 'hostname', 'ip'])
        pprint_table(data)

    def login(self, key, user='zhangzirui', dev_host='172.16.124.19'):
        print self.keys_conf.keys()
        if key not in self.keys_conf:
            print >> sys.stderr, 'unknow key'
            return 0
        conf = self.keys_conf[key]
        host = conf['ip']
        cmd = 'ssh -t %s@%s ssh %s@%s' % (user, dev_host, user, host)
        print cmd
        os.system(cmd)

    def _update(self):
        pass


def get_arguments():
    '''get arugments
    '''
    parser = ArgumentParser("Strategy Driver")
    parser.add_argument("--host", '-H', dest='host', help='remote host ip')
    parser.add_argument("--ip", dest='host', help='remote host ip')
    parser.add_argument("--key", '-k', dest='key', help='host key')
    #parser.add_argument("-key", metavar='in-file', help='host key')
    parser.add_argument("--list", '-l', dest='list_info', action='store_true', help='list host')
    parser.add_argument("--to", '-t', dest='to_key',  help='dest host key')
    parser.add_argument("--user", '-u', dest='user', default='zhangzirui', help='user name')
    return parser.parse_args()


def main():
    args = get_arguments()
    jumper = HostJumper()
    if args.list_info:
        jumper.show_host()
    elif args.to_key:
        jumper.login(args.to_key, args.user)
    else:
        print args
        pass


if __name__ == '__main__':
    main()
