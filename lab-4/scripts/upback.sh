#!/bin/bash

restore_dir="/home/user/restore/"
backup_dir="/home/user/"

latest_backup=$(find "$backup_dir" -maxdepth 1 -type d -name "Backup*" | sort -n | tail -n 1)

if [ -z "$latest_backup" ]; then
    echo "Error: No backup directory found."
    exit 1
fi

mkdir -p "$restore_dir"

cp -rT "$latest_backup/" "$restore_dir"

echo "Restore directory $restore_dir has been updated with files from latest backup $latest_backup."