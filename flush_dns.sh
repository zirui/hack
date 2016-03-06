#!/bin/bash

echo 'flush dns...'
#sudo discoveryutil udnsflushcaches

sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder; say cache flushed
echo 'finished'
