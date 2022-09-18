#!/bin/bash

leanYearMonths=(31 28 31 30 31 30 31 31 30 31 30 31)
month=$(date +"%m")
if [[ "$month" == 0* ]]
then
m=${month##0}
else m=$month
fi
echo ${leanYearMonths[$m-1]}

