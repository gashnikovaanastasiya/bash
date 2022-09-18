#!/bin/bash

status=$(ps -ef | grep httpd | wc -l)
#echo $status
#var2=0
#echo $var2
if [ "$status" -gt "1" ]; then
echo "This machine is running a web server"
    #exit 1;
fi
