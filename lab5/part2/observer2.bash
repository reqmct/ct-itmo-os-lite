#!/bin/bash

echo "" > 2.log

while true
do
    top -b -n 1 > stats
    flg=$(cat stats | grep "mem[2]*.bash")
    if [[ -z $flg ]]
    then
        rm stats
        break
    fi
    echo "$(cat stats | head -n 5 | tail -n 2)" >> 2.log
    echo "$(cat stats | head -n 12 | tail -n 5)" >> 2.log
    echo "------------------------" >> 2.log
    sleep 1
done


