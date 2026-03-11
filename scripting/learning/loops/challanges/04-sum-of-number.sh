#!/bin/bash

<<comment
Ask user for a number n.
Calculate sum of numbers from 1 to n.
Example:
If n=5
Output: 15
comment

read -p "Enter number for loop" n
for (( i=1; i<=n; i++ ))
do
	echo $i
done
