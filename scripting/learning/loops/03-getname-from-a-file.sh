#!/bin/bash


FILE=/tmp/passwd.bak

for name in $(cat $FILE )
do
  	$name awk '{print $1}'
done
