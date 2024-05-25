#!/bin/bash

# Subnet to ping
SUBNET="192.168.1"

# Loop through all possible values for x (0-255)
for i in {0..255}
do
    # Ping the server with a timeout of 1 second
    if ping -c 1 -W 1 ${SUBNET}.${i} > /dev/null 2>&1
    then
        echo "Server ${SUBNET}.${i} is Up and Running"
    else
        echo "Server ${SUBNET}.${i} is Unreachable"
    fi
done
