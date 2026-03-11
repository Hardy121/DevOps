#!/bin/bash


set -x

check_service(){
	service_name=$1

	if systemctl is-active "$service_name"
	then
		echo "$service_name is running"
	else
		echo "$service_name is Not running"
	fi
}

services=("ssh" "cron" "docker")

for service in "${services[@]}"
do
	check_service "$service"
done
