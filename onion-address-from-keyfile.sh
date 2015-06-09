#!/bin/bash

filename=$1
if [ -z $filename ]; then
	echo "Please specify the HS private key file."
	exit 1
fi

if [ ! -f $filename ]; then
	echo "$filename not found"
	exit 1
fi

openssl rsa -in $filename -pubout -outform DER 2>/dev/null | tail -c +23 | sha1sum | head -c 20 | python -c \
"""
import base64, sys
print base64.b32encode(sys.stdin.readline().strip('\n').decode('hex')).lower() + '.onion'
"""
