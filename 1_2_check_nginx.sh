#!/bin/bash

port_check=$(ss -tulpn | grep :80)

file_check="/var/www/html/index.html"

if [ -n "$port_check" ] && [ -z "$file_check" ]; then
    exit 0
else
    exit 1
fi
