#!/bin/bash


cpu=$(top -bn1 | grep "CPU" | awk '{print $2}' | cut -d. -f1 )

if [[ $cpu -gt 80 ]]
then
	echo "High CPU usage!"
else
	echo "CPU usage normal"
fi
