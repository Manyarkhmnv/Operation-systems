# script.bash

#!/bin/bash
while [[ "$var1" != "q" ]]
do
	read var1
	var2+="$var1 "
done
echo "$var2"
