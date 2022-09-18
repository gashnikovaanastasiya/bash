#!/bin/bash

magicNumber=$(( $RANDOM % 100 ))
#echo "$magicNumber"
while read var; do
if [ $var -gt $magicNumber ]; then
echo "greater"
elif [ $var -lt $magicNumber ]; then
echo "less"
else echo "you win"
fi
done
