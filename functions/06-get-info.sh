#!/bin/bash

if [ -d $1 ]
then
for file in $1/*
do
stat --printf='File: %n\nType: %F\nPermissions: %a/%A\n' "$file"
echo "------------------------------"
done
else 
stat --printf='Name: %n\nType: %F\nPermissions: %a/%A\n' "$1"
fi
