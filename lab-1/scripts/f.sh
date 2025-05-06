#!/bin/bash

awk '$3 = /install/ || $3 = /status/ && $4 = /installed/ { print $0 }' /var/log/dpkg.log > install.log
