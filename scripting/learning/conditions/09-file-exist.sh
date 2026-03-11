#!/bin/bash

 
filename=/home/hardik/scripting/conditions/08-cpu-usage-alert.sh

if [[ ! -f $filename ]]
then
	echo "file doesnot exist"
else
	echo "file exist"
fi
