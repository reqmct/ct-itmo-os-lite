#!/bin/bash

trash="$HOME/.trash"
log="$HOME/.trash.log"

if [[ $# -ne 1 ]]; then
    echo "Incorrect number of arguments"
    exit 1
fi

if [[ ! -f $log ]]
then
    echo "$log not found"
    exit 1
fi

if [[ ! -d $trash ]]
then
    echo "$trash not found"
    exit 1
fi

matches=$(grep "/$1" $log)

IFS=$'\n'

for line in $matches; do
    echo "Restore $line?(y/n)"
    read cmd
    while [[ $cmd != "y" && $cmd != "n" ]]
    do
        echo "Incorrect input (y/n)"
        read cmd
    done
    
    score_space=$(echo $line | grep -o ' ' | wc -l)
    score_space=$((score_space + 1))
    first_half=$((score_space / 2))
    second_half=$((first_half + 1))
    first_part=$(echo $line | cut -d ' ' -f 1-$first_half)
    second_part=$(echo $line | cut -d ' ' -f $second_half-$score_space)
    
    if [[ $cmd == "n" ]]
    then
        continue
    fi
    path=${first_part%/*}
    if [[ ! -d $path ]]
    then
        echo "$path not found. File will be restored to $HOME"
        path=$HOME
    fi
    name=$1
    while [[ -f "$path/$name" ]]
    do
        echo "$path/$name exists. Enter a new file name."
        read name
    done
    ln "$trash/$second_part" "$path/$name"
    rm "$trash/$second_part"
    sed -i "/$second_part/d" $log
done


