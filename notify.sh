#!/bin/bash
# A simple bash script to send text messages to your phone when friends are on IRC.
# This works off of irssi logs when the log exists and friends are in the notify list
# Usage in CRON <* * * * * ./notify.sh username>

#Set location of logs here
LOG_LOC=/home/username/.irssi/logs/Network
#Set the mobile phone text message email address
MP_TXT_EMAIL=2125551234@txt.verizon.net

if [ -z $1 ]; then
  echo "You must specify a nickname"
  exit
fi

FILE_MODIFIED_TIME=`stat -c %Z ${LOG_LOC}/${1}.log`
CURRENT_TIME=`date +%s`
TIME_SINCE_MODIFIED=$((CURRENT_TIME-FILE_MODIFIED_TIME))
if [ $TIME_SINCE_MODIFIED -lt 60 ]; then
  LINE=`tail -1 ${LOG_LOC}/${1}.log | grep "has joined to" | sed -e "s/\[//g" | sed -e "s/\]//g"`
  NAME=`echo $LINE | awk '{ print $6 }'`
  INFO=`echo $LINE | awk '{ print $5 }' | sed -e "s/@/ /g"`
  if [ -n "${LINE}" ]; then
    echo "$1 is on IRC.  NAME: $NAME INFO: $INFO" | mail -s $1 $MP_TXT_EMAIL
  fi
fi
