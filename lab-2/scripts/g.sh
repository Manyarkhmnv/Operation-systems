#!/bin/bash
declare -A start_read_bytes
for pid in /proc/[0-9]*/; do
    if [ -f "${pid}io" ]; then
    read_bytes=$(awk '/read_bytes/ {print $2}' "${pid}io")
    start_read_bytes["${pid}"]=$read_bytes
    fi
done
sleep 60
declare -A diff
for pid in "${!start_read_bytes[@]}"; do
    if [ -f "${pid}io" ]; then
    end_read_bytes=$(awk '/read_bytes/ {print $2}' "${pid}io")
    pid_number=$(basename "$pid")
    diff["$pid_number"]=$((end_read_bytes - ${start_read_bytes["$pid"]}))
    fi
done
for pid in $(printf "%s\n" "${!diff[@]}" | sort -nr -k1 -t: -S1 | head -n 3); do
    if [ -f "/proc/$pid/cmdline" ]; then
    cmd=$(tr '\0' ' ' < "/proc/$pid/cmdline")
    cmd="${cmd::-1}" 
    printf "%s:%s:%d\n" "$pid" "$cmd" "${diff[$pid]}"
    fi
done