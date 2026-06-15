#!/bin/bash

PRIORITY_FILE="/etc/keepalived/check_priority"


BASE_PRIORITY=150

LA=$(uptime | awk -F'average:' '{print $2}' | awk -F, '{print $1}' | tr -d '[:space:]')


LA_INT=$(echo "$LA" | awk '{print int($1+0.9)}')


NEW_PRIORITY=$((BASE_PRIORITY - LA_INT))


if [ "$NEW_PRIORITY" -lt 10 ]; then
    NEW_PRIORITY=10
fi


echo "$NEW_PRIORITY" > "$PRIORITY_FILE"

echo "$NEW_PRIORITY"
