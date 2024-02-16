#!/bin/bash

for pid in $(ps -eo pid=)
do
path_status="/proc/$pid/status"
path_sched="/proc/$pid/sched"
if [ -f $path_status ] && [ -f $path_sched ];
then
    ppid=$(sed -n '7p' $path_status | awk '{print $2}')
    sum_exec_runtime=$(sed -n '5p' $path_sched | awk '{print $3}')
    nr_switches=$(sed -n '7p' $path_sched | awk '{print $3}')
    art=$(echo  $sum_exec_runtime / $nr_switches | bc -l)
    echo ProcessID=$pid: Parent_ProcessID=$ppid : Average_RunningTime=$art
fi
done | sort -Vk2 > task4.log

