#!/bin/bash

while true; do
    read LINE
    echo "$LINE" > pipe
    if [[ $LINE == "QUIT" ]]
    then
        exit
    fi
done

