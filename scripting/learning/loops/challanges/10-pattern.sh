#!/bin/bash

read -p "enter lines" line

for (( i=1; i<=line; i++ ))
do
    for (( j=1; j<=i; j++ ))
        do
       echo -n " * "
	    done
        echo
done
