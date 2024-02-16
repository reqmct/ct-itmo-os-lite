#!/bin/bash

restore="$HOME/restore"
regex="[0-9]\{4\}-[0-1][0-9]-[0-3][0-9]"

if [[ ! -d $restore ]] 
then
    mkdir $restore
fi

backup=$(ls -d $HOME/*/ | grep "/Backup-$regex/"|sort -r|head -n 1)
if [[ backup == "" ]] 
then
    echo "Cant't find backup"
    exit 1
fi

copy_files=$(ls $backup | grep -v ".$regex")
IFS=$'\n'
for line in $copy_files
do
    cp $backup/$line $restore/$line
done

