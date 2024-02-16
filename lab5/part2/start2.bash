#!/bin/bash

./mem.bash &
./mem2.bash &
sleep 1
./observer2.bash
sleep 2
sudo dmesg | grep "mem[2]*.bash" > dmesg2.log

