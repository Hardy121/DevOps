#!/bin/bash


read -p "Enter your marks:" marks

if [[ $marks -ge 80 ]]
then
	echo "You are pass with distinction"
elif [[ $marks -ge 60 ]]
then 
	echo "You are pass with first class"
elif [[ $marks -ge 40 ]]
then 
	echo "You are pass with second class"
elif [[ $marks -ge 33 ]]
then 
	echo "You are pass"
else
	echo "You are fail"
fi
