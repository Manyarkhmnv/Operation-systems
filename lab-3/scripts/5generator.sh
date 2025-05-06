#!/bin/bash

named_pipe="/tmp/named_pipe"

echo "+" > "$named_pipe"
echo "2" > "$named_pipe"
echo "*" > "$named_pipe"
echo "3" > "$named_pipe"
echo "+" > "$named_pipe"
echo "5" > "$named_pipe"
echo "QUIT" > "$named_pipe"
