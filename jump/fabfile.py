#!/usr/bin/env python
#coding=utf8
"""
# Author: zirui
# Created Time : Sat Aug  6 23:45:56 2016

# File Name: fabfile.py
# Description:

"""

import sys
reload(sys)
sys.setdefaultencoding('utf-8')


from fabric.api import run
def host_type():
    run('uname -s')
