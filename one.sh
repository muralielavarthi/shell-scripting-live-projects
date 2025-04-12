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

who | awk '{print $1,$3,$4,$5}' >/root/Users_Login_Data/Users_$TIMESTAMP.txt

# ec2-user pts/0        2025-04-12 13:47 (49.37.242.23)
# This tells you that the user ec2-user is currently logged into the EC2 instance  
# and connected remotely from the IP address 49.37.242.23. The login occurred on April 12, 2025, at 13:47.
