#!/bin/bash

TIMESTAMP=$(date +"%m-%d-%y-%H-%M")
FILE_NAME="Users+$TIMESTAMP"

mkdir -p /root/Users_Login_Data/

who | awk '{print $1,$3,$4,$5}' >>/root/Users_Login_Data/$FILE_NAME



