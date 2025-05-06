# script.bash
#!/bin/bash

home="/home/user/lab-1/scripts"
directory="$PWD"
if [[ $directory == $home ]]
then echo "$directory" & exit 0
else echo "Error" & exit 1
fi
exit 0
