#!/bin/bash

if [ "$1" -lt "18" -a "$2" = no ]; then
echo "you can not go to the party"
elif [ "$1" -lt "18" -a "$2" = yes ]; then
echo "you may go but must be back before midnight"
elif [ "$1" -ge "18" -a "$2" = "" ]; then
echo "you can go to the party"
fi

