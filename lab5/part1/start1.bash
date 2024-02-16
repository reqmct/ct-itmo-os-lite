#! /bin/bash

./mem.bash &
sleep 1
./observer1.bash
sleep 2
sudo dmesg | grep "mem.bash" > dmesg.log

