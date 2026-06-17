#!/bin/bash

# Logs
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo "Pls run script with root user access" | tee -a $LOGS_FILE
    exit 1
fi

mkdir -p $LOGS_FOLDER # create if not yet created

VALIDATE()
{
# $? - exit status of previous command
if [ $1 -ne 0 ]; then
    echo "installing $2 failed" | tee -a $LOGS_FILE # tee -a appends all commands execution to log file
else
    echo "installing $2 successful" | tee -a $LOGS_FILE
fi
}

# Loops
for package in $@  # sudo 4_Shell.sh nginx mysql nodejs
do
    dnf list installed $package | tee -a $LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "$package not installed, installing now"
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE $? "$package"
    else
         echo "$package already installed, skipping"
    fi
done