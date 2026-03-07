#!/bin/bash
<<comment
Create a file data.txt with at least 5 lines.
Write script that:
Reads file line by line using while read
Prints line number + content
comment

i=1
while read line	
do
	echo "$i : $line"
	(( i++ ))
done < data.txt
