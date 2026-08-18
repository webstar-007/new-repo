#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <number>"
    echo "Example: $0 30"
    exit 1
fi

num=$1

if (( num % 15 == 0 )); then
    echo "tomcat"
elif (( num % 3 == 0 )); then
    echo "tom"
elif (( num % 5 == 0 )); then
    echo "cat"
else
    echo "Number is not divisible by 3, 5 or 15"
fi