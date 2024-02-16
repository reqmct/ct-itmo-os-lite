#!/bin/bash

if [[ ! -f "$1" ]]
then
    echo "$1 not found"
    exit 1
fi

if [[ ! -d "$2" ]]
then
    echo "$2 not found"
    exit 1
fi

rsync -av --append --progress "$1" "$2"


