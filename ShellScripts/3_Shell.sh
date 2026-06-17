#!/bin/bash

# Functions
VALIDATE()
{
# $? - exit status of previous command
if [ $1 -ne 0 ]; then
    echo "installing $2 failed"
else
    echo "installing $2 succesful"
fi
}

# check if root user id or not
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo "Pls run script with root user access"
    exit 1
fi

echo "Installing nginx"
dnf install nginx -y
VALIDATE $? "nginx"

echo "Installing mysql"
dnf install mysql -y
VALIDATE $? "mysql"



# > - Redirections Concept
ls -l 1>output.txt - stores only sucessful command output in output.txt 
lsds -l 2>output.txt - stores only failed command output in output.txt 
lsgf -l &>output.txt - stores all success/failed command output in output.txt 

> - will override previous command output
>> - will append previous command output