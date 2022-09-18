#!/bin/bash

#file=~/paths
while read -r line; do
#echo $line
if [ ${line:(-1)} == "/" ]; then
mkdir "$line"
else
touch $line
fi
#echo $line
done < paths
