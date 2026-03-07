#!/bin/bash




ls -t | awk 'NR>7 {print}' | while read -r file 
do 
	echo "$file"
done
