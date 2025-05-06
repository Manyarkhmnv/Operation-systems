#!/bin/bash

backup_dir="/home/user/"
source_dir="/home/user/source/"
report_file="/home/user/backup-report"

current_date=$(date "+%Y-%m-%d")
backup_name="Backup-$current_date"

recent_backup=$(find "$backup_dir" -maxdepth 1 -type d -name "Backup*" -ctime -7 | head -n 1)

if [ -z "$recent_backup" ]; 
then
    mkdir "$backup_dir$backup_name"
    echo "New backup directory $backup_name was created on $current_date" >> "$report_file"
    cp -r $source_dir* "$backup_dir$backup_name"
    
    echo "Files copied to $backup_name:" >> "$report_file"
    ls $source_dir >> "$report_file"
else
    for file in $source_dir*
    do
        filename=$(basename "$file")
        
        if [ ! -f "$recent_backup/$filename" ]; 
        then
            cp "$file" "$recent_backup"
        elif [ $(stat -c %s "$file") -ne $(stat -c %s "$recent_backup/$filename") ]; 
        then
            cp "$file" "$recent_backup/$filename.$current_date"
            echo "Version of $filename created on $current_date" >> "$report_file"
        fi
    done
    
    echo "Changes made in existing backup directory $recent_backup on $current_date:" >> "$report_file"
    ls $source_dir >> "$report_file"
    
    added_files=$(diff -rq "$source_dir" "$recent_backup" | grep "Only in $source_dir" | cut -d ' ' -f 4)
    for file in $added_files
    do
        old_name="$file.$current_date"
        echo "$file $old_name" >> "$report_file"
    done
fi