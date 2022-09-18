#!/usr/bin/bash

usern=$(whoami)
groupinfo=$(id -g)
groupp=$(id -ng)
curd=$(pwd)
dat=$(date)
echo "User's home directory: $HOME"
echo "Username: $usern"
echo "User ID: $UID"
echo "Group information:$groupinfo , $groupp" 
echo "Terminal: $TERM"
echo "Current directory: $curd"
echo "Date and Time: $dat"
