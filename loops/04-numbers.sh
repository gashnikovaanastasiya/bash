#!/bin/bash

array=$(seq 1 100)
for item in ${array}; do
if [ $[$item%2] -eq 0 -a \( "$item" -lt "30" -o "$item" -gt "60" \) -a "$item" -lt "85" ]; then
echo $item
fi
done
