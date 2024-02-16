#!/bin/bash

for ((i=0; i < 10; i++))
do
    ./newmem.bash 4800000 &
    sleep 1
done

