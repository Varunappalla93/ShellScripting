#!/bin/bash

# Logs
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo "Pls run script with root user access"
    exit 1
fi

mkdir -p $LOGS_FOLDER # create if not yet created

VALIDATE()
{
# $? - exit status of previous command
if [ $1 -ne 0 ]; then
    echo "installing $2 failed"
else
    echo "installing $2 succesfull"
fi
}



echo "Installing nginx"
dnf install nginx -y &>> $LOGS_FILE
VALIDATE $? "nginx"

echo "Installing mysql"
dnf install mysql -y &>> $LOGS_FILE
VALIDATE $? "mysql"