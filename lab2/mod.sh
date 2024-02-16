#!/bin/bash

zombies=$(ps -xal | grep "defunct" | awk '{ print $4 }')

for ppid in $zombies; do
    kill -s SIGCHLD $ppid
done

zombies=$(ps -xal | grep "defunct" | awk '{ print $4 }')

for ppid in $zombies; do
    kill -9 $ppid
done

