#!/bin/bash

file="/etc/passwd"

if [[ -f $file ]]
then
	cp $file /tmp/passwd.bak
	echo "Backup created"
else
	echo "file not found"
fi
