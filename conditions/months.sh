#!/bin/bash

leanYearMonths=(31 28 31 30 31 30 31 31 30 31 30 31)
month=$(date +"%B")
case $month in
January)
echo ${leanYearMonths[0]}
;;
February)
echo ${leanYearMonths[1]}
;;
March)
echo ${leanYearMonths[2]}
;;
April)
echo ${leanYearMonths[3]}
;;
May)
echo ${leanYearMonths[4]}
;;
June)
echo ${leanYearMonths[5]}
;;
July)
echo ${leanYearMonths[6]}
;;
August)
echo ${leanYearMonths[7]}
;;
September)
echo ${leanYearMonths[8]}
;;
October)
echo ${leanYearMonths[9]}
;;
November)
echo ${leanYearMonths[10]}
;;
December)
echo ${leanYearMonths[11]}
;;
esac
