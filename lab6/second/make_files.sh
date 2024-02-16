#!/bin/bash

size=100000
for ((i = 1; i <= $1; i++ )); do
    echo "1" > "files/$i.log"
    for ((j = 2; j <= size; j++)); do
        echo "$j" >> "files/$i.log"
    done
done

