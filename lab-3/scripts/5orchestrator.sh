#!/bin/bash

named_pipe="/tmp/named_pipe"

mkfifo "$named_pipe"

./5handler.sh &
./5generator.sh

wait

rm "$named_pipe"
