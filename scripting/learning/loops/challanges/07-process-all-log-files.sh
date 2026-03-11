#!/bin/bash
<< comment
Create 3 dummy .log files.
Write a script that:
Loops over all .log files
Prints file name
Prints number of lines inside each file
comment

for i in /var/log/*log
do
	echo "file name $i"
	echo "file lines $( wc -l < $i )"
	echo "--------------------------"
	
done
