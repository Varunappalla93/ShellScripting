#!/bin/bash

# print statement
echo "HEllO SHELL WORLD"

# variables - ${VAR} or $VAR
NAME=VARUN
AGE=32
echo HELLO MY NAME IS ${NAME} and I am $AGE YEARS OLD
# HELLO MY NAME IS VARUN and I am 32 YEARS OLD

# pass args via terminal - sh 1_HelloWorld.sh QA1 43
NAAM=$1
UMAR=$2
echo HELLO MY NAME IS ${NAAM} and I am ${UMAR} YEARS OLD
# HELLO MY NAME IS QA1 and I am 43 YEARS OLD


echo "Pls enter your email"
read email
echo email is $email

echo "Pls enter your password"
read -s password  # -s is for secret
echo password is $password