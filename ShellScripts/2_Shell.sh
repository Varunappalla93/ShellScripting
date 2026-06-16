#!/bin/bash

# Special Variables
echo "All args passed to script - $@" 
echo "No of vars passed to script - $#"
echo "Script Name - $0"
echo "present directory - $PWD"
echo "who is running script - $USER"
echo "Home directory - $HOME"
echo "PID of script - $$"
sleep 100 & 
echo "To access background process id - $!"
echo "exit status of previous command - $?"

# $@ treats args separately, $* treats as single arg.

# eg:
# sh 2_Shell.sh 1 2 3 4 5 99
# All args passed to script - 1 2 3 4 5 99
# No of vars passed to script - 6
# Script Name - 2_Shell.sh
# present directory - /home/ec2-user/ShellScripting/ShellScripts
# who is running script - ec2-user
# Home directory - /home/ec2-user
# PID of script - 2113
# To access background process id - 2114


# Data types - number and string(default)
NUM1=100
NUM2=200 # if string is given, it takes as 0 by default
SUM=$(($NUM1+NUM2))
echo "SUM IS: $SUM"

# Arrays
FRUITS=("APPLE","BANANA","POMO")
echo "Fruits are ${FRUITS[@]}" # prints complete array
echo "First Fruit is ${FRUITS[0]}" # prints first element of array


# conditions
# if-elif-else
NUMBER=25
if [ $NUMBER -gt 20 ]; then
    echo "$NUMBER is greater than 20"
elif [$NUMBER -eq 20]; then
    echo "$NUMBER is equal to 20"    
else
    echo "$NUMBER is less to 20"    
fi


# exit codes - ranges from 0 to 127
# 0 - success
# non 0 - failure