#!/bin/bash

FREE_SPACE=$( free -mt | grep "Total"| awk '{print $4}' )
TH="${1:-500}"
echo "$TH"

if [[ $FREE_SPACE -lt $TH ]]
then
	echo "WARNING, RAM is running low $FREE_SPACE"
else
	echo "RAM space is sufficient - $FREE_SPACE"
fi
