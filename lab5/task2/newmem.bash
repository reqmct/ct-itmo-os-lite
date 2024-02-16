#!/bin/bash

arr=()
cnt=0

while true
do
    arr+=(1 2 3 4 5 6 7 8 9 10)
    cnt=$((cnt + 10))
    if [[ cnt -gt $1 ]]
    then
        exit 0
    fi
done

