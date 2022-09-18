#!/bin/bash

file=accounts.csv
touch accounts_new.csv
echo $(head -n 1 accounts.csv)>> accounts_new.csv
quote='"'
sobaka='@'
while read -r line; do
#columns that remain unchanged 
id=$(echo $line | awk -F, '{print $1}')
location=$(echo $line | awk -F, '{print $2}')
org=$(echo $line | awk -F, '{print $3}')
serv=$(echo $line | awk -F, '{print $4}')
if [[ $line == *"$quote"* ]]; then
title=$(echo $line | awk -F '"' '{print $2}')
department=$(echo $line | awk -F, '{print $9}')
elif [[ $line == *"$sobaka"* ]]; then
title=$(echo $line | awk -F, '{print $6}')
department=$(echo $line | awk -F, '{print $8}')
else
title=$(echo $line | awk -F, '{print $6}')
department=$(echo $line | awk -F, '{print $8}')
fi
#name format
str=$(echo $line | awk -F , '{print $5}')
namesurname=$(echo  $str | awk '{for (i=1;i <=NF; i++) {sub(".",substr(toupper($i),1,1),$i)} print}')
#email
name=$(echo $str | awk '{print substr($0,1,1)}')
surname=$(echo $str | awk -F' ' ' {print $2}')
var3="$name$surname"
newemail=$(echo "$var3" | tr '[:upper:]' '[:lower:]')$location"@abc.com"
echo $id,$location,$org,$serv,$namesurname,$title,$newemail,$department>>accounts_new.csv
done < $file
sed -i '2d' accounts_new.csv


