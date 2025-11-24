#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo "$2 --FAILUR"
    elso
       echo "$2 --SUCCESS"
}

if [ $USERID -ne 0 ]
then 
   echo "ERROR::You must have sudo access to excute this script"
   exit 1 #other than 0
fi


dpkg -l | grep tree

if [ $? -ne 0 ]
then
   apt install tree -y
   VALIDATE $? "Installing tree"
elso
   echo "tree is already installed--Installed" 
fi   

dpkg -l | grep mysql-server -y
if [ $? -ne 0 ]
then
   apt install mysql-server -y 
   VALIDATE $? "Installing mysql-server"
elso
   echo "MYSQl is already installed--Installed" 
fi 


dpkg -l | grep git

if [ $? -ne 0 ]
then
   apt install git -y
   VALIDATE $? "installing git"
elso
   echo "Git is already installed--Installed" 
fi 
