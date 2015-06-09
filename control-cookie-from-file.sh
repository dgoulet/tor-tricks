#!/bin/bash

# For this file to be generated, you need to set "CookieAuthentication 1" in
# your torrc. Usually found in /var/lib/tor/control_auth_cookie

filename=$1
if [ -z $filename ]; then
	echo "Please specify the control cookie file."
	exit 1
fi

if [ ! -f $filename ]; then
	echo "$filename not found"
	exit 1
fi

hexdump -e '32/1 "%02x""\n"' $filename
