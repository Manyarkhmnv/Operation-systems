# script.bash

#!/bin/bash
echo "Write 1 - if you want open nano"
echo "Write 2 - if you want open vi"
echo "Write 3 - if you want open links"
echo "Write 4 - if you want exit"
read context
case "$context" in
"1" ) nano;;
"2" ) vi;;
"3" ) elinks;;
"4" ) exit 0;;
*) echo "command not found";;
esac

