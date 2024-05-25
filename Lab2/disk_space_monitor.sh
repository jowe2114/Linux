#!/bin/bash

# Define threshold and email parameters
THRESHOLD=01 #Put Your own threshold, i was just trying so i put 01
EMAIL="kj.sd345@gmail.com"
SUBJECT="Disk Space Alert"
BODY="/tmp/disk_space_alert.txt"

# Get the disk usage percentage for the root filesystem
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check if disk usage exceeds the threshold
if [ $DISK_USAGE -gt $THRESHOLD ]; then
  echo "Subject: $SUBJECT" > $BODY
  echo "Disk space usage is above $THRESHOLD%. Current usage: $DISK_USAGE%" >> $BODY
  df -h >> $BODY
  msmtp -a default $EMAIL < $BODY
fi

# Clean up
rm $BODY
