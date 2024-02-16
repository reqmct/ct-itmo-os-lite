#!/bin/bash

input_file="files/$1.log"
cnt=0

while IFS= read -r value
do
    mul=$((value * 2))
    echo "$mul" >> "$input_file"
    (( cnt++ ))
    if [[ $cnt == 100000 ]]; then
        exit 0
    fi
done < "$input_file"

