#!/bin/bash

TIMESTAMP=$(date +"%m-%d-%y-%H-%M")
FILE_NAME="Users+$TIMESTAMP"
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
who | awk '{print $1,$3,$4,$5}' >>/root/Users_Login_Data/$FILE_NAME



