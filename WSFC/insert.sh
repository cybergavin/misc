#!/bin/bash
# cybergavin on 1st July 2020
# Quick'n'Dirty script to insert data into a table
# Replace <SQL AG Listener>, <username> and <password> with the correct values
#
############################################################################################################
if [ $# -ne 1 ]; then
   echo "USAGE: ./insert.sh <TEST NAME>"
   exit 999
fi
testrun=$1
i=0
while [ true ]
do
  i=$(( i + 1 ))
  sed "s/~~TEST~~/$testrun/g;s/~~NUM~~/$i/g" insert.sqlt > insert.sql
  { time sqlcmd -S <SQL AG Listener> -U <username> -P <password> -b -M -K -i insert.sql > insert.stdout 2>insert.stderr; } 2>> ${testrun}_insert.log
  if [ $? -eq 0 ]; then
     echo "`date '+%Y-%b-%d %H:%M:%S'` : Successfully inserted record" >> ${testrun}_insert.log
  else
     echo "`date '+%Y-%b-%d %H:%M:%S'` : FAILED to insert record" >> ${testrun}_insert.log
  fi
  sleep 1
done