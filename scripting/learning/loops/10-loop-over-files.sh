#!/bin/bash

for file in /var/log/*.log
do
	while read user
	do
		        echo "User: $user"
		done < $file
done

