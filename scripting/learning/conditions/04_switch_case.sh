#!/bin/bash


echo "Hey Choose an option"
echo "a = To see the current date"
echo "b = list all the files in current directory"

read choice

case $choice in 
	a)
	       	date
		;;
	b)
	       	ls
		;;
	*) 
		echo "Please choose valid option"
esac

