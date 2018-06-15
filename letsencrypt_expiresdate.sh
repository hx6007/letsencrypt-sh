#!/bin/bash
expiresdate=`cat /var/log/letsencrypt/renew.log | grep "/etc/letsencrypt/live/" | grep "expires on" | head -n 1 | awk -F " " '{ print $4 }'`
first_stamp=`date -d "$expiresdate 00:00:00" +%s`
today_stamp=`date +%s`                          
let day_stamp=($first_stamp - $today_stamp)    
let day=($day_stamp/86400)                     
echo $day
if [[ $day -gt 20 ]] ;then
echo "more then 20"
    exit 1
else
/bin/sh /root/sh/letsencrypt_renew.sh
fi
