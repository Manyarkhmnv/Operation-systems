#!/bin/bash
max_mem=0
pid=0

for dir in /proc/[0-9]*
do
    if [ -f $dir/status ] && [ -r $dir/status ]; 
    then
        mem=$(grep VmRSS $dir/status | awk '{print $2}')
        if [ "$mem" -gt "$max_mem" ]; 
        then
            max_mem=$mem
            pid=$(echo $dir | cut -d '/' -f 3)
        fi
    fi
done

echo "Процесс, использующий больше всего RAM: PID=$pid с использованием $max_mem kB RAM."
echo "Тоже самое с top:"
top -b -o +%MEM | head -n 10
