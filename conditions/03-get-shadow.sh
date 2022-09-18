#!/bin/bash

if [ \( -r /etc/shadow \) -a \( $? -eq 0 \) ]; then
echo "Command succeeded";
else echo "Command failed"
fi
