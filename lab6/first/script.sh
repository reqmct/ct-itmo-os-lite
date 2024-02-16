#!/bin/bash

num=600000
for (( i = 1; i <= num; i++ )); do
    if (( i % $1 == 0 )); then
        (( count++ ))
    fi
done

echo "Result $1: $count"

