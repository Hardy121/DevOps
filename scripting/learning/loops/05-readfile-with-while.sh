#!/bin/bash

while read user
do
	echo "User: $user"
done < /tmp/passwd.bak
