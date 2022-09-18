#!/bin/bash

for filename in * 
do 
USER=$(stat -c '%U' $filename)
echo "Filename: $filename , Owner: $USER"
done
