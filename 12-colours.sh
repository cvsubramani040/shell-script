#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"


VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo "$2 --$R FAILUR"
    else
       echo "$2 --$G SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then 
   echo "ERROR::You must have sudo access to excute this script"
   exit 1 #other than 0
fi


dpkg -l | grep tree > /dev/null

if [ $? -ne 0 ]
then
   apt install tree -y
   VALIDATE $? "Installing tree"
else
   echo "tree is already installed--$Y Installed" 
fi   

dpkg -l | grep mysql-server > /dev/null
if [ $? -ne 0 ]
then
   apt install mysql-server -y 
   VALIDATE $? "Installing mysql-server"
else
   echo "MYSQl is already installed--$Y Installed" 
fi 


dpkg -l | grep git > /dev/null

if [ $? -ne 0 ]
then
   apt install git -y
   VALIDATE $? "installing git"
else
   echo "Git is already installed--$Y Installed" 
fi 
