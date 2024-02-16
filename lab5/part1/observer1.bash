#!/bin/bash

echo "" > 1.log

while true
do
    top -b -n 1 > stats
    line=$(cat stats | grep "mem.bash")
    if [[ -z $line ]]
    then
        rm stats
        break
    fi
    
    echo "$(cat stats | head -n 5 | tail -n 2)" >> 1.log
    echo $line >> 1.log
    echo "$(cat stats | head -n 12 | tail -n 5)" >> 1.log
    echo "------------------------" >> 1.log
    sleep 1
done

