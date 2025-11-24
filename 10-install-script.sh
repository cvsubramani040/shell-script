#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "ERROR::You must have sudo access to excute this script"
fi


apt install mysql-server -y
apt install git -y
