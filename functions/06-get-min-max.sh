#!/bin/bash

max=$1
min=$1
for i do
if [ "$i" -gt "$max" ]; then
max=$i
fi
if [ "$i" -lt "$min" ]; then
min=$i
fi
done
echo "Min: $min"
echo "Max: $max"

