# script.bash

#!/bin/bash

read var1 var2 var3
if [[ var1 -gt var2 ]] && [[ var1 -gt var3 ]]
then echo "$var1"
fi
if [[ var2 -gt var1 ]] && [[ var2 -gt var3 ]]
then echo "$var2"
fi
if [[ var3 -gt var1 ]] && [[ var3 -gt var2 ]]
then echo "$var3"
fi

