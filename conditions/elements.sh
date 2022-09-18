#!/bin/bash

mas=()
function rand() {
    echo $((RANDOM % ${1}))
}
for item in `seq 1 10`
do
    value="$(rand 100)"
    echo "[$item]=> ${value}"
    mas+=($value)
done
max=${mas[$1]}
min=${mas[$1]}
for i in "${mas[@]}"
do
if [ "$i" -gt "$max" ]; then
max=$i
fi
if [ "$i" -lt "$min" ]; then
min=$i
fi
sum=$(expr $sum + $i)
done
#echo "${mas[@]}"
echo "max: $max"
echo "min: $min"
echo "sum: $sum"
