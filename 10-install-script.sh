#!/bin/bash

USERID=$(id -u)


if [ $USERID -ne 0 ]
then 
   echo "ERROR::You must have sudo access to excute this script"
   exit 1 #other than 0
fi


dpkg -l | grep tree

if [ $? -ne 0 ]
then
   apt install tree -y
   if [ $? -ne 0 ]
   then
      echo "Installing tree ---FAILURE"
      exit 1
   else
      echo "Installing tree ---SUCCESS"
    fi
else
   echo "tree is already installed--Installed" 
fi   

dpkg -l | grep mysql-server -y
if [ $? -ne 0 ]
then
   apt install mysql-server -y 
   if [ $? -ne 0 ]
   then
      echo "Installing MYSQL ---FAILURE"
      exit 1
   else
      echo "Installing MYSQL ---SUCCESS"
   fi
else
   echo "MYSQl is already installed--Installed" 
fi 


dpkg -l | grep git

if [ $? -ne 0 ]
then
   apt install git -y
   if [ $? -ne 0 ]
   then
      echo "Installing git ---FAILURE"
      exit 1
   else
      echo "Installing git ---SUCCESS"
   fi
else
   echo "Git is already installed--Installed" 
fi 
