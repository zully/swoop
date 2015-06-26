#!/bin/bash
#A Simple bash script that can be executed on boot and/or by cronjob that
#will launch irssi in a screen session and connect to the network of your
#choice

ON=`screen -ls | grep chat | wc -l`
if [ $ON == 0 ]; then
  screen -dmS chat irssi -c Network
fi
