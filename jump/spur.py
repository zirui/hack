#!/usr/bin/env python
#coding=utf8
"""
# Author: zirui
# Created Time : Mon Aug  8 00:43:56 2016

# File Name: spur.py
# Description:

"""

import sys
reload(sys)
sys.setdefaultencoding('utf-8')

import spur
#sys.exit()

shell = spur.SshShell(hostname="xxxx",
                      username="user",
                      password="yyy")
with shell:
    result = shell.run("display version")
print result.output
