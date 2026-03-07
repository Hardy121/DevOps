#!/bin/bash

<<comment
Print countdown from 10 to 1.
After reaching 1, print:
Time's up!
comment

for (( i=1; i<=10; i++ ))
do
	echo $i
	sleep 1s
done

echo "time's up!"
