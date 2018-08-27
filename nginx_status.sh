#!/bin/bash
ps xua | grep nginx | grep master >/dev/null 2>&1
LE_STATUS=$?
   if [ "$LE_STATUS" != 0 ]; then
	/usr/local/nginx/sbin/nginx
	exit 1
fi

