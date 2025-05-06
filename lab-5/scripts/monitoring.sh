#!/bin/bash

while true
do
    free -m | grep "^Mem:" | awk '{print $2}' >> total_memory.log
    free -m | grep "^Swap:" | awk '{print $3}' >> swap_memory.log
    getconf PAGE_SIZE | awk '{print $1}' >> page_size.log
    free -m | grep "^Mem:" | awk '{print $4}' >> free_physical_memory.log
    free -m | grep "^Swap:" | awk '{print $4}' >> free_swap_space.log
    top -b >> top.txt
    sleep 1
done