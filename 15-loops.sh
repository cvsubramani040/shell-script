#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

LOGS_FOLDER="/var/log/shell-script.logs"
LOGS_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOGS_FILE-$TIMESTAMP.log"

# Ensure logs folder exists
if [ ! -d "$LOGS_FOLDER" ]; then
   mkdir -p "$LOGS_FOLDER"
fi


VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo "$2 --$R FAILUR"
    else
       echo "$2 --$G SUCCESS"
    fi
}

echo "Script started excuting at: $TIMESTAMP"&>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then 
   echo "ERROR::You must have sudo access to excute this script"
   exit 1 #other than 0
fi

for package in $@
do
   dpkg  -l $package -y &>>$LOG_FILE_NAME
   if [ $? -ne 0 ]
    then
        apt install $package -y &>>$LOG_FILE_NAME
        VALIDATE $? "Installing $package"

    else
        echo -e "$package is already $Y ... INSTALLED $N"
    fi

done