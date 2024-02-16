#!/bin/bash

ps -eo pid=,lstart= | sort -rk2 | head -n 1 | awk '{print $1}'

