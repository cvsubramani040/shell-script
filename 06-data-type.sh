#!/bin/bash

a=$1
b=$2
TIME_STAMP=$(date)

echo "Script excuted at: $TIME_STAMP"
SUM=$((a+b))
echo "SUM of $a and $b is : $SUM"