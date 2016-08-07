#!/usr/bin/env python
#coding=utf8
"""
# Author: zirui
# Created Time : Mon Aug  8 00:32:17 2016

# File Name: px.py
# Description:

"""

import sys
reload(sys)
sys.setdefaultencoding('utf-8')

import pxssh
s = pxssh.pxssh()
if not s.login ('localhost', 'myusername', 'mypassword'):
    print "SSH session failed on login."
    print str(s)
else:
    print "SSH session login successful"
    s.sendline ('ls -l')
    s.prompt()         # match the prompt
    print s.before     # print everything before the prompt.
    s.logout()
