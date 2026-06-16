#!/bin/bash

# print statements
echo "HEllO SHELL WORLD"

# variables - ${VAR} or $VAR
NAME=VARUN
AGE=32
echo HELLO MY NAME IS ${NAME} and I am $AGE YEARS OLD
# HELLO MY NAME IS VARUN and I am 32 YEARS OLD

# pass args via terminal - sh 1_shell.sh QA1 43
NAAM=$1
UMAR=$2
echo HELLO MY NAME IS ${NAAM} and I am ${UMAR} YEARS OLD
# HELLO MY NAME IS QA1 and I am 43 YEARS OLD


echo "Pls enter your email"
read email # store email into $email variable
echo email is $email

echo "Pls enter your password"
read -s password  # store password into $password variable, -s is for secret
echo password is $password

# take command output into a variable.
START_TIME=$(date +%s)
echo "script executed at $START_TIME" # script executed at 1781518412

sleep 10 # to pause script for 10 secs

END_TIME=$(date +%s)
echo "script executed at $END_TIME"  # script executed at 1781518422

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "Script executed in $TOTAL_TIME secs" # Script executed in 10 secs