#!/bin/bash

<< comment
Print numbers from 1 to 20.
All numbers divisible by 3
comment


for (( i=1; i<=20; i++ ))
do
	if (( i % 3 == 0 ))
	then
	continue
	fi
        echo "$i"
done

