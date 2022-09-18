#!/bin/bash

while read -r var; do
if [ $var != "stop" ]; then
echo "Hello ${var}"
else exit
fi
done
