#!/bin/bash

# Logs
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

# Colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# to catch errors using set and trap without using VALIDATE()
# set -e 
# trap 'echo "there is error in $LINENO, Command: $BASH_COMMAND"' ERR

# check if user is root user or not, if not stop script using exit 1
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo -e " $R Pls run script with root user access $N" | tee -a $LOGS_FILE
    exit 1
fi


mkdir -p $LOGS_FOLDER # create if not yet created

# function to verify if packages are installed or failed
VALIDATE()
{
# $? - exit status of previous command
if [ $1 -ne 0 ]; then
    echo -e "installing $2 ..$R failed $N" | tee -a $LOGS_FILE # tee -a appends all commands execution to log file
else
    echo -e "installing $2 ..$G successful $N" | tee -a $LOGS_FILE
fi
}

# Loops and check for packages, if installed skip it or else install it
for package in "$@"  # sudo 4_Shell.sh nginx mysql nodejs
do
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "$package not installed, installing now"
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE $? "$package"
    else
         echo -e "$package already installed, $Y skipping $N"
    fi
done