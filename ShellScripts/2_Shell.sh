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
echo "To access background process id - $!" # eg: sleep 100 & 

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


# Data types
