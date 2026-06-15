#!/bin/bash

# Special Variables
echo "All args passed to script - $@"  # All args passed to script - 1 2 3 4 5 99
echo "No of vars passed to script - $#"
echo "Script Name - $0"
echo "present directory - $PWD"
echo "who is running script - $USER"
echo "Home directory - $HOME"
echo "PID of script - $$"
echo "To access background process id - $!" # eg: sleep 100 & 