#!/bin/bash

named_pipe="/tmp/named_pipe"

result=1
mode="+"

while true; 
do
    if read line; 
    then
        if [[ $line == "QUIT" ]]; 
        then
            echo "Итоговый результат: $result"
            break
        elif [[ $line == "+" ]]; 
        then
            mode="+"
        elif [[ $line == "*" ]]; 
        then
            mode="*"
        elif [[ $line =~ ^-?[0-9]+$ ]]; 
        then
            if [[ $mode == "+" ]]; 
            then
                result=$((result + line))
            else
                result=$((result * line))
            fi
        else
            echo "Ошибка входных данных: $line"
            exit 1
        fi
    fi
done < "$named_pipe"
