#!/bin/bash

if [ $# -eq 0 ]; 
then
    echo "Ошибка: не указано имя файла для восстановления."
    exit 1
fi

filename=$1
logFile="$HOME/.trash.log"

entries=$(grep -F "$filename" "$logFile")

if [ -z "$entries" ]; 
then
    echo "Файл $filename не найден в корзине."
    exit 1
fi

echo -e "Найдены следующие файлы для восстановления:\n$entries"

while read -r entry;
do
    originalFile=$(echo "$entry" | cut -d':' -f1)
    count=$(echo "$entry" | cut -d':' -f2)
    
    read -p "Вы хотите восстановить файл $originalFile? (y/n): " file_response
    if [ "$file_response" != "y" ];
    then
        continue
    else 
        exit 1
    fi
    
    if [ -e "$HOME/.trash/$count" ];
    then
        targetDir=$(dirname "$originalFile")
        if [ ! -d "$targetDir" ]; 
        then
            echo "Каталог $targetDir не существует, восстановление в домашний каталог."
            targetDir="$HOME"
        fi
        
        if [ ! -e "$targetDir/$(basename "$originalFile")" ];
        then
            ln "$HOME/.trash/$count" "$targetDir/$(basename "$originalFile")" || {
                echo "Не удалось создать жесткую ссылку, выполняю копирование файла обратно."
                cp "$HOME/.trash/$count" "$targetDir/$(basename "$originalFile")"
            }
        else
            echo "Файл уже существует в месте назначения, пропускаем."
        fi

        rm "$HOME/.trash/$count"
    else
        echo "Файл $count отсутствует в каталоге корзины."
    fi
done <<< "$entries"

echo "Файл(ы) успешно восстановлены."