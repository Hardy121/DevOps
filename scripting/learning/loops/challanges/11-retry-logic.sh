#!/bin/bash

for (( i=1; i<=5; i++ ))
do
	if curl -f google.com
	then
		break
	fi
	sleep 2
done
