#!bin/bash

ps -e -o pid=,cmd= | while read line
do
    pid=$(echo $line | awk '{print $1}')
    cmd=$(echo $line | awk '{$1=""; print $0}')
    if [ -r "/proc/$pid/io" ]; then
        bytes=$(cat /proc/$pid/io | sed -n 5p | awk '{print $2}')
        echo $pid : $cmd : $bytes
    fi
done

