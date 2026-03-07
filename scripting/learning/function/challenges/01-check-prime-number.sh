#!/bin/bash

read -p "Enter number to check prime number: " number

function checkNum {
	
	for (( i=2; i<number; i++ ))
	do
		if (( $1 % i == 0 ))
		then
			return 1
			break
		fi
	done

	return 0

}

checkNum number
echo $?
