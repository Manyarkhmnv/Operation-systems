#!/bin/bash

scriptPath="./1.sh"

(crontab -l; echo "*/5 * * * 1 bash $scriptPath") | crontab -