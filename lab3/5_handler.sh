#!/bin/bash

rez=1
mode=0

(tail -f pipe) |
while true; do
    read line
    case $line in
        "QUIT")
            pid = $(pgrep -P $$ -f "tail")
            kill -9 $pid
            echo "exit"
            exit
            ;;
        "+")
            mode=0
            ;;
        "*")
            mode=1
            ;;
        *)
            if [[ $line =~ ^-?[0-9]+$ ]]
            then
                if [[ $mode -eq 0 ]]
                then
                    rez=$(($rez+$line))
                    echo $rez
                else
                    rez=$(($rez*$line))
                    echo $rez
                fi
            else
                pid = $(pgrep -P $$ -f "tail")
                kill -9 $pid
                echo "inccorect line: $line"
                exit
            fi
            ;;
    esac
done

