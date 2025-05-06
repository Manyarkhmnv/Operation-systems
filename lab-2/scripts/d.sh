#!/bin/bash
for pid in $(ps -a -x -o  pid)
do
        ppid=$(grep -E -s -h "PPid" /proc/"$pid"/status | grep -E -s -o "[0-9]+")
        art1=$(grep -E -s -h "sum_exec_runtime" /proc/"$pid"/sched | grep -E -s -o "[0-9.]+")
        art2=$(grep -E -s -h "nr_switches" /proc/"$pid"/sched | grep -E -s -o "[0-9.]+")
        if [[ -n $art2 ]]
        then
        let art3=art1/art2
        fi
        if [[ -z $art3 ]]
        then 
        art3=0
        fi
        if [[ -n $ppid ]]
        then 
        echo "ProcessID=$pid : Parent_ProcessID=$ppid : Average_Running_Time = $art3"
        fi
done | sort -n -t "=" -k3 > task_d.txt

