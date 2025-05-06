#!/bin/bash

CHAT_FILE="./CHAT_FILE.txt"
USERS_FILE="./USERS_FILE.txt"

cleanup() {
    sed -i "/^$LOGIN$/d" "$USERS_FILE"
    echo "[$LOGIN вышел из чата]" >> "$CHAT_FILE"
}

read -p "Введите ваш логин для чата: " LOGIN

if grep -x "$LOGIN" "$USERS_FILE"; 
then
    echo "Этот логин уже используется, выберите другой."
    exit 1
fi

echo "$LOGIN" >> "$USERS_FILE"
echo "[$LOGIN вошел в чат]" >> "$CHAT_FILE"

trap "cleanup" EXIT

receive_messages() {
    tail -f "$CHAT_FILE" | while read line; 
    do echo "$line"; 
    done
}

receive_messages &

RECEIVER_PID=$!

while read line; 
do
    [[ "$line" == "QUIT" ]] && {
        kill "$RECEIVER_PID"
        wait "$RECEIVER_PID"
        break
    }
    echo "[$LOGIN] $line" >> "$CHAT_FILE"
done

cleanup
