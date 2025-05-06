#!/bin/bash
grep -o -h -r -s -E '[a-zA-Z0-9._]+@[a-zA-Z]+(\.[a-zA-Z]+)+' /etc | awk '{printf ("%s, ", $1)}' > emails.lst
