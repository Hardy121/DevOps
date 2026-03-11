#!/bin/bash

<<comment

If you find files more than a given size(eg. 20MB) or files older then given days (eg.10days).
Compress those files and move int a archive folder. 

comment

#REVISION:001
#Tue Mar  3 14:43:24 IST 2026

set -eou pipefail

#Variables
BASE=/home/hardik/scripting
DAYS=10
DEPTH=1
RUN=0

#check if the directory is present or not
if [[ ! -d $BASE ]]
then
	echo "directory does not exist: $BASE"
	exit 1
fi

#Create archive folder if not exist
if [[ ! -d "$BASE/archive" ]]
then
	echo "creating archive folder......"
	mkdir $BASE/archive
fi

for i in `find $(pwd) -maxdepth $DEPTH -type f -size +1k`
do
	if [[ $RUN -eq 0 ]]
	then
		echo "$(date) archiving $i ==> $BASE/archive"
	        gzip $i || exit 1
       	        mv $i.gz $BASE/archive || exit 1	       
	fi
done


echo "====================================================="

for file in `find -maxdepth $DEPTH -type f -mtime +"$DAYS"`
do
	if [[ $RUN -eq 0 ]] 
	then
		echo "$(date) archiving $i ==> $BASE/archive"
		gzip $file || exit 1
		mv $file.gz $BASE/archive || exit 1
	fi
done
