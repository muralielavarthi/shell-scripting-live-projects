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


mkdir -p /root/Users_Login_Data/

who > output.txt 
awk '{print $1,$3,$4,$5}' output.txt >/root/Users_Login_Data/Users_$TIMESTAMP.txt


