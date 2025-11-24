#!/bin/bash

NUMBER=$1

if [$NUMBER -gt 100]
then
    echo "Given number is greater then 100"
else
    echo "given number is less then or equal to 100"
fi