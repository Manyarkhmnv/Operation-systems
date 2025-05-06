#!/bin/bash
ps -u user > task_a.txt
ps -u user | wc -l > result_task_a.txt
awk '{ print $1 " : " $4}' task_a.txt >> result_task
