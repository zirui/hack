#!/usr/bin/env python
#coding=utf8
"""
# Author: zirui
# Created Time : Mon Aug  8 00:20:19 2016

# File Name: t.py
# Description:

"""

import sys
reload(sys)
sys.setdefaultencoding('utf-8')

import paramiko
client = paramiko.SSHClient()
client.load_system_host_keys()
client.set_missing_host_key_policy(paramiko.WarningPolicy())
client.connect("172.16.124.19", username="zhangzirui", password="1FDojMjP")
stdin, stdout, stderr = client.exec_command('display version')
for line in stdout:
    print line.strip('\n')
client.close()
