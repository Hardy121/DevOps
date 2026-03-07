#!/bin/bash

read -p "Check your number is it even?: " number

check_even(){
	if (( $1 % 2 == 0 ))
	then
		return 0
	else
		return 1
	fi
}
check_even number
echo $?
