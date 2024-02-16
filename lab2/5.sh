#!/bin/bash

cnt=0
ppid=$(head -n 1 "task4.log" | awk -F ':' '{print $2}' | awk -F '=' '{print $2}')
sum_art=0

while read line
do
    curr_ppid=$(echo $line | awk -F ':' '{print $2}' | awk -F '=' '{print $2}')
    curr_art=$(echo $line | awk -F ':' '{print $3}' | awk -F '=' '{print $2}')
    if [ $ppid == $curr_ppid ]
    then
        cnt=$((cnt+1))
        sum_art=$(echo $sum_art + $curr_art | bc -l)
    else
        art=$(echo $sum_art / $cnt | bc -l)
        echo Average_Running_Chidren_of_ParentID=$ppid is $art
        ppid=$curr_ppid
        sum_art=$curr_art
        cnt=1
    fi
    echo $line
done < "task4.log" > "task5.log"
art=$(echo $sum_art / $cnt | bc -l)
echo Average_Running_Children_of_ParentID=$ppid is $art >> "task5.log"

