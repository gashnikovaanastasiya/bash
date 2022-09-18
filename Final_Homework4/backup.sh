#!/bin/bash

Name=$(date +"%d-%m-%Y-%H:%M:%S")
tar -cpzvf /backup/$Name.tar.gz /root/ /home/
echo "5 18 * * * /bin/bash /home/devops/backup.sh">>/var/spool/cron/root

