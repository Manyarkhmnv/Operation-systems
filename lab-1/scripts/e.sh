#!/bin/bash

awk '$3 = /status/ { print $0 }' /var/log/dpkg.log > info.log
