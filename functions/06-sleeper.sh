#!/bin/bash

status=$(ps -ef | grep "[s]leep 1000" | wc -l)
if [ "$status" -lt "1" ]; then
sleep 1000 &
fi

