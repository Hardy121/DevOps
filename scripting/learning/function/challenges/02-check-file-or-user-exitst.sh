#!/bin/bash


read -p "Read name: " name

check_exits(){

	input="$1"
	
	if [ -z "$input" ]
       	then
		echo "Error: no argument provided"
		return 2
	fi

	if [[ -e "$input" ]]
       	then
		echo "'$input' exist as a file or a directory"
		return 0
	fi

	if id "$input" &>/dev/null  
	then
		echo "User '$input' exits."
		return 0
	fi

}

check_exits name
