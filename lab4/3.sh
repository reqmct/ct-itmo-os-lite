#!/bin/bash

src="$HOME/source"
report="$HOME/backup-report"
date1=$(date '+%Y-%m-%d')

backup=$(ls -d $HOME/*/ | grep "/Backup-[0-9]\{4\}-[0-1][0-9]-[0-3][0-9]/"|sort -r|head -n 1)
date2=$(echo $backup | grep -o "[0-9]\{4\}-[0-1][0-9]-[0-3][0-9]")
date1_s=$(date -d "$date1" +%s)
date2_s=$(date -d "$date2" +%s)
dif=$((date1_s - date2_s))
dif=$((dif / 86400))
if [[ $backup == "" ]]
then
    dif=7
fi
if [[ ! -f $report ]]
then
    touch $report
fi
if [[ $dif -lt 7 ]]
then
    old_backup="$HOME/Backup-$date2"
    echo "Backup was updated: $old_backup; date: $date1" >> $report
    echo "New files:" >> $report
    lines=$(ls $src)
    IFS=$'\n'
    for line in $lines
    do
        if [[ ! -f "$old_backup/$line" ]]
        then
            cp $src/$line $old_backup/$line
            echo $line >> $report
        fi
    done
    echo "Updated files:" >> $report
    for line in $lines
    do
        bytes1=$(stat -c %s "$src/$line")
        bytes2=$(stat -c %s "$old_backup/$line")
        if [[ $bytes1 != $bytes2 ]] 
        then
            mv "$old_backup/$line" "$old_backup/$line.$date1"
            cp $src/$line $old_backup/$line
            echo "$line $line.$date1" >> $report
        fi
    done
    
else
    new_backup="$HOME/Backup-$date1"
    mkdir $new_backup
    cp $src/* $new_backup
    echo "New backup was created: $new_backup; date: $date1" >> $report
    echo "Files copied:" >> $report
    ls $new_backup >> $report
fi



