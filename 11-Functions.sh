#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo "$2 --FAILUR"
    else
       echo "$2 --SUCCESS"
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
   echo "tree is already installed--Installed" 
fi   

dpkg -l | grep mysql-server > /dev/null
if [ $? -ne 0 ]
then
   apt install mysql-server -y 
   VALIDATE $? "Installing mysql-server"
else
   echo "MYSQl is already installed--Installed" 
fi 


dpkg -l | grep git > /dev/null

if [ $? -ne 0 ]
then
   apt install git -y
   VALIDATE $? "installing git"
else
   echo "Git is already installed--Installed" 
fi 
