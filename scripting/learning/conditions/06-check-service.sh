#!/bin/bash

read -p "Enter service name to check status " service

if systemctl is-active $service
then
	systemctl status $service
else
	echo "$service is not working"
fi
