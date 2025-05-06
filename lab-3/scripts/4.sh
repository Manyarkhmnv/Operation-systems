#!/bin/bash
./loop.sh & pid1=$!
./loop.sh &
./loop.sh &
#top
renice +10 -p "$pid1"
kill "$pid1"
#top