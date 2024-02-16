#!/bin/bash

arr=()
cnt=0

echo ""  > report2.log

while true
do
    arr+=(1 2 3 4 5 6 7 8 9 10)
    cnt=$((cnt + 1))
    if [[ cnt -eq 100000 ]]
    then
        echo "${#arr[@]}" >> report2.log
        cnt=0
    fi
done

