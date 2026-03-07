#!/bin/bash

<<comment
Print numbers from 1 to 50, but only even numbers.
You must use a loop.
You must use a condition inside loop.
You are not allowed to hardcode step as {2..50..2}.
comment

for (( i=1; i<=50; i++ ))
do
	if (( i % 2 == 0  ))
	then
		echo $i
	fi
done
