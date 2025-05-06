#!/bin/bash

if [ $# -eq 0 ]; 
then
    echo "Ошибка: не указан файл для удаления."
    exit 1
fi

trashDir="$HOME/.trash"
if [ ! -d "$trashDir" ]; 
then
    mkdir "$trashDir"
fi

cp "$1" "$trashDir"
copiedFile="$trashDir/$(basename "$1")"

count=$(ls -1 "$trashDir" | wc -l)
ln "$copiedFile" "$trashDir/$count"
rm "$1"

echo "$copiedFile:$count" >> "$HOME/.trash.log"

echo "Файл $1 удален и перемещен в каталог $trashDir под именем $count."
