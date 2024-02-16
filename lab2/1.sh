#!/bin/bash

ps --no-header -u $USER | wc -l > task1.log
ps -u $USER -o pid,command >> task1.log

