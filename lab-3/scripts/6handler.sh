#!/bin/bash

value=1

add_two() {
    value=$((value + 2))
}

multiply_by_two() {
    value=$((value * 2))
}

trap 'add_two' USR1
trap 'multiply_by_two' USR2
trap 'echo "Обработчик завершил работу"; exit' SIGTERM

while true
do
    echo $value
    sleep 1
done
