#!/bin/bash

# eg: touch -d 20260101 shipping.log - to create shipping log file on that particular date.

# Logs
LOGS_DIR="/home/ec2-user/app-logs"
LOGS_FILE="$LOGS_DIR/$0.log"

# Colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ ! -d $LOGS_DIR ]; then
    echo -e "$LOGS_DIR does not exist"
    exit 1
fi
    
# to check files older than 14 days and delete it
FILES_TO_DELETE=$(find $LOGS_DIR -name "*.log" -mtime +14)
# echo "$FILES_TO_DELETE"


while IFS= read -r filepath; do
    echo "Deleting file: $filepath"
    rm -f $filepath
    echo "Deleted file: $filepath"
done <<< $FILES_TO_DELETE