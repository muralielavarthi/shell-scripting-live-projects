#!/bin/bash
MSG="Script 1"
A="20"
source ./script2.sh
echo "Hello from: $MSG" #MSG variable will be override by script 2 value (o/p: Hello from: Script 2)
echo "A value: $A" #A variable will be override by script 2 value (o/p: A value: 10)