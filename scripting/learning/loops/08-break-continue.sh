#!/bin/bash


#break

echo "break loop starts"

for i in {1..10}
do
	if [ $i -eq 5 ]
	then
		break
	fi
	echo $i
done


#continue
echo "continue loop starts"

for i in {1..10}
do
	if [  $i -eq 3 ]
	then
		continue
	fi
	echo $i
done
