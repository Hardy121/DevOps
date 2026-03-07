#!/bin/bash

read -p "Enter your first value" firstValue
read -p "Enter your second value" secondValue



function calculator {

	local first=$1
	local second=$2 
	echo "The sum of $first and $second is $(( first + second ))"
}

calculator firstValue secondValue 
