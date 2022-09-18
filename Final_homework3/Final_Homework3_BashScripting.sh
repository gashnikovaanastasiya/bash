#!/bin/bash

file=accounts.csv
touch accounts_new.csv
quote='"'
echo $(head -n 1 accounts.csv)>> accounts_new.csv
sed -i "/name,/s//name,userid,/" accounts_new.csv
while read -r line; do
id=$(echo $line | awk -F, '{print $1}')
location=$(echo $line | awk -F, '{print $2}')
org=$(echo $line | awk -F, '{print $3}')
serv=$(echo $line | awk -F, '{print $4}')
namesurname=$(echo $line | awk -F , '{print $5}')
if [[ $line == *"$quote"* ]]; then
tit=$(echo $line | awk -F '"' '{print $2}')
title="$quote$tit$quote"
email=$(echo $line | awk -F , '{print $8}')
department=$(echo $line | awk -F, '{print $9}')
else
email=$(echo $line | awk -F , '{print $7}')
title=$(echo $line | awk -F, '{print $6}')
department=$(echo $line | awk -F, '{print $8}')
fi
#userid without numbers
name=$(echo $namesurname | awk '{print substr($0,1,1)}')
surn=$(echo $namesurname | awk -F' ' ' {print $2}')
userid=$(echo "$name$surn" | tr '[:upper:]' '[:lower:]')
echo $id,$location,$org,$serv,$namesurname,$userid,$title,$email,$department>>accounts_new.csv
done < $file
file2=accounts_new.csv
mas=()
while read -r line; do
usr_id=$(echo $line | awk -F, '{print $6}')
array_of_userid+=($usr_id)
done < $file2
repeated_userid=($(for i in "${array_of_userid[@]}"; do echo $i; done | sort | uniq -D | uniq))
k=($(for i in "${array_of_userid[@]}"; do echo $i; done | sort | uniq -c | sort -r -k1 | head -n1 | awk '{print $1}'))
for i in ${repeated_userid[@]}
do
for (( j=1; j<=$k; j++ ))
do
#creating userid with numbers
sed -i "0,/$i,/s//$i"$j",/" accounts_new.csv
done
done
#changing first line in accounts_new.csv
sed -i '2d' accounts_new.csv


