#!/bin/bash

TIMESTAMP=$(date +"%m-%d-%y-%H-%M")
USER_ID=$UID

function rootValidate(){
    if [ $1 -ne 0 ]
    then
        echo "Root access is required"
        exit 1
    fi
}
rootValidate $USER_ID

find /root/Users_Login_Data/ -type f -name "*.txt" -mmin +60 > old_files.txt
cat old_files.txt

while read line
do
    echo $line >> /root/Users_Login_Data/delete.log
    rm -rf $line
done <<< old_files.txt

# -mmin option checks the file's modification time, which refers to the last time the contents of the file were changed
# -cmin stands for "change", specifically change of file status (not content).
# c:change, m:minutes
# File metadata changed will be checked (permissions,owner,hardlinks,Renaming or moving the file)
# Referring to specific changes to the file's attributes
# -cin +60 : were last changed more than 60 minutes ago
