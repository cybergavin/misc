#!/bin/bash
# cybergavin on 4th July 2020
# Quick'n'Dirty script to stop load test
#
########################################################################################
for p in `ps -ef | grep "[i]nsert.sh" | awk '{print $2}'`
do
  kill -9 $p
done
########################################################################################