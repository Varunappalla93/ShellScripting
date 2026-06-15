#!/bin/bash

# Special Variables
echo "All args passed to script - $@"  # All args passed to script - 1 2 3 4 5 99
# No of args passed to script - $#
# Script Name - $0
# present directory - $PWD
# who is running script - $USER
# Home directory - $HOME
# PID of script - $$
# $! - to access background process id, eg: sleep 100 & 