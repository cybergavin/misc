#!/bin/bash
# cybergavin on 4th July 2020
# Quick'n'Dirty script to load data into a table using multiple processes/connections
#
########################################################################################
if [ $# -ne 2 ]; then
   echo "USAGE: ./startloadDB.sh <test name> <number of threads>"
   exit 999
fi
test_name=$1
num_threads=$2
count=1
while [ $count -le $num_threads ]
do
  nohup ./insert.sh ${test_name}-${count} &
  count=$(( count + 1 ))
done
#########################################################################################