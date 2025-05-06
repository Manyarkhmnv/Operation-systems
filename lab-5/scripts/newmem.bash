#!/bin/bash

counter=0
arr=()
N=$1

while  [[ "${#arr[@]}" -lt $N ]];
do
    arr+=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
    ((counter++))
done

echo "Array size exceeded $N elements"