#!bin/bash

grep -s "VmRSS" /proc/*/status | sort -nr -k2 | head -n 1
top -b -n1 -o %MEM | sed -n '8p'

