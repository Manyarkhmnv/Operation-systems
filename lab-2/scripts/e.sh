#!/bin/bash
previous_ppid=-1
sum=0
num=0
while read str ; do
    echo $str
    art=$(echo $str | cut -d ":" -f 3 | grep -E -s -o "[0-9]+")
    ppid=$(echo $str | cut -d ":" -f 2 | grep -E -s -o "[0-9]+")
    if (( previous_ppid != -1 && ppid != previous_ppid )) ; 
    then
        echo Average_Running_Children_of_ParentID=$previous_ppid is $(echo "scale=2; $sum / $num" | bc -l)
        sum=0
        num=0
    fi
    sum=$(echo "scale=2; $sum + $art" | bc -l)
    previous_ppid=$ppid
    ((num++))
done < task_d.txt > task_e.txt
echo Average_Running_Children_of_ParentID=$previous_ppid is $(echo "scale=2; $sum / $num" | bc -l) >> task_e.txt
