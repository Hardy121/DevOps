#!/bin/bash

<<comment 
Write a script that prints numbers from 1 to 20 using
Method A → range {1..20}
Method B → C-style for (( )) 
comment

for i in {1..20}
do
	echo $i
done

for (( i=1; i<=20; i++ ))
do
	echo $i
done


