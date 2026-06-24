#!/bin/bash

# Logs
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"

# Colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SRC_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # 14 days is default value if user did not supply

# to get Logs
LOG()
{
    echo -e "$(date '+%Y-%m-%d %H:%M:%S') | $*" | tee -a "$LOGS_FILE"
}


# check if user is root user or not, if not stop script using exit 1
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo -e " $R Pls run script with root user access $N"
    exit 1
fi


mkdir -p "$LOGS_FOLDER" # create if not yet created


USAGE()
{
    LOG "$R USAGE:: sudo backup <SRC_DIR> <DEST_DIR> <DAYS>[Default 14 Days] $N"
    exit 1
}


if [ $# -lt 2 ]; then
    USAGE
fi

if [ ! -d "$SRC_DIR" ]; then
    LOG "$R Source Directory: $SRC_DIR does not exist $N"
    exit 1
fi


if [ ! -d "$DEST_DIR" ]; then
    LOG "$R Destination Directory: $DEST_DIR does not exist $N"
    exit 1
fi

# find files
FILES=$(find "$SRC_DIR" -name "*.log" -type f -mtime +"$DAYS")

LOG "BACKUP STARTED"

LOG "SOURCE DIRECTORY: $SRC_DIR"

LOG "DESTINATION DIRECTORY: $DEST_DIR"

LOG "DAYS: $DAYS"

if [ -z "$FILES" ]; then
    LOG "No files to archive, $Y skipping $N"
else
    LOG "Files found to archive: $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.tar.gz"
    LOG "Archive name: $ZIP_FILE_NAME"
    tar -zcvf $ZIP_FILE_NAME $(find $SRC_DIR -name "*.log" -type f -mtime +$DAYS)

    if [ -f $ZIP_FILE_NAME ]; then
        LOG "Archive is success"

    while IFS= read -r filepath; do
        LOG "Deleting file: $filepath"
        rm -f $filepath
        LOG "Deleted file: $filepath"
    done <<< $FILES
    else
        LOG "Archive is $R failed $N"
        exit 1
    fi
fi


# run this script as command
# sudo cp 6_Shell.sh /usr/bin/backup
# sudo chmod +x /usr/bin/backup
# now give sudo backup /home/ec2-user/app-logs /home/ec2-user/dest-dir to run this script as command.