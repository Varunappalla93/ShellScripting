#!/bin/bash

# Functions
VALIDATE()
{

# $? - exit status of previous command
if [ $1 -ne 0 ]; then
    echo "installing $2 failed"
else
    echo "installed $2 succesfull"
fi
}


USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo "Pls run script with root user access"
    exit 1
fi


dnf install nginx -y
VALIDATE $? "nginx"

dnf install mysql -y
VALIDATE $? "nginx"