#!/bin/sh
/opt/nginx/sbin/nginx -s stop
/usr/local/src/letsencrypt/letsencrypt-auto renew -nvv --standalone > /var/log/letsencrypt/renew.log 2>&1
LE_STATUS=$?
/opt/nginx/sbin/nginx

if [ "$LE_STATUS" != 0 ]; then
    echo Automated renewal failed:
    cat /var/log/letsencrypt/renew.log
    exit 1
fi
