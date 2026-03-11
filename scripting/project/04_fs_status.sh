#!/bin/bash

FU=$(df -h / | grep /dev/sdd | awk '{print $5}' | tr -d %)
MAX_DISK="${1:-80}"

if [[ $FU -ge "$MAX_DISK" ]]
then 
	echo "WARNING: Disk usage above threshold $FU % " | mail -s "DISK SPACE ALERT!" hardikmerwork@gmail.com
else

	echo "All good"
fi
