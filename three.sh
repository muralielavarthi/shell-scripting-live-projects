#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 #real projects will monitor for 70
MSG=""

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1) 
    # from 50% value we are cutting % since it can't be compared with number
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    #echo "Partition: $PARTITION , Usage: $USAGE"
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MSG+="High Disk usage on partition: $PARTITION Usage is: $USAGE \n " 
        # \n for output to come in new line
        # + to append value variable instead of replacing the content
    fi
done <<< $DISK_USAGE

echo -e "Message: $MSG"

echo "$MSG" | mutt -s "High Disk Usage" muralis2p@gmail.com # sending email(-s:subject line)