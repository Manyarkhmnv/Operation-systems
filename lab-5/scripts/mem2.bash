#!/bin/bash
counter=0
arr=()
while true
do
    arr+=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
    ((counter++))
    if [ $((counter % 100000)) -eq 0 ];
    then
        echo "${#arr[@]}" >> report2.log
    fi
done
