#!/bin/bash

target=$1
logfile=$2

echo "" > $logfile

for ((i = 1; i <= 20; i++)); do
    count=0
    echo "n: $i" >> $logfile
    echo "--------------------" >> $logfile
    for ((j = 0; j < 1; j++)); do
        ./make_files.sh $i
        { \time -f "%E" ./$target $i ; } 2>> $logfile
    done
done
