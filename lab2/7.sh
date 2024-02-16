#!bin/bash

bash script.sh > tmp.log
sleep 60
bash script.sh >> tmp.log
prev_pid=""
prev_score=0

sort tmp.log -n -k1 | awk -F ' : ' '{ if ($1==prev_pid) printf("%s %d %s\n", $1, $3-prev_score, $2); prev_pid=$1; prev_score=$3}' | sort -n -k2 -r | head -n3 | awk '{ printf("%s : %s : %s\n"), $1, $3, $2}'

rm tmp.log

