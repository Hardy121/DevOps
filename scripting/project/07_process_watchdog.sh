#!/bin/bash
set -eou pipefail
IFS=$'\n\t'

SERVICE_NAME=${1:-}

if [[ ${#} -eq 0 ]]
then
	echo "Please provide arguments"
	exit 1
fi

RUNNING_SERVICES=$(pgrep -c "$SERVICE_NAME" || true)

if [[ $RUNNING_SERVICES -eq 0 ]] 
then 
	echo "$SERVICE_NAME is not running. restarting....."
	sudo systemctl restart "$SERVICE_NAME"

	sleep 5 

	RUNNING_SERVICES=$(pgrep -c "$SERVICE_NAME" || true)

	if [[ "$RUNNING_SERVICES" -gt 0 ]];
	then
		echo "$SERVICE_NAME restarted sucessfully"
		exit 0
	else
		echo "Failed to restart $SERVICE_NAME"
		exit 1
	fi
fi
echo "$SERVICE_NAME is running normally"

exit 0

