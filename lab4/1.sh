#!/bin/bash

trash="$HOME/.trash"

if [[ $# -ne 1 ]]
then
    echo "Incorrect number of arguments"
    exit 1
fi

if [[ ! -f "$1" ]]
then
    echo "Can't find file $1"
    exit 1
fi

if [[ ! -d $trash ]]
then
    mkdir -p $trash
    echo "$trash is created"
fi

cnt=0
name=$1

while [[ -f "$trash/$name" ]]
do  
    name=$cnt$1
    ((cnt ++))
done

ln "$1" "$trash/$name"
rm "$1"

log="$HOME/.trash.log"

if [[ ! -f $log ]]
then
    touch $log
    echo "$log is created"
fi

echo $(realpath "$1") $name >> $log

