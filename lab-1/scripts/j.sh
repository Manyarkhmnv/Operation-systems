#!/bin/bash

man bash | grep -o '\<[A-Za-z]\{4,\}\>' | sort | uniq -c | sort -r -n | head -n 3
