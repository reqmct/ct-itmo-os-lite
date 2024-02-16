#!/bin/bash

script="infinite.sh"
bash $script &
pid1=$!
bash $script &
pid2=$!
bash $script &
pid3=$!

top -b -n1 -p $pid1,$pid2,$pid3

cpulimit -l 10 -p $pid1

kill $pid3

sleep 5
top -b -n1 -p $pid1

kill $pid1
kill $pid2

