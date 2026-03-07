#!/bin/bash

for num in 1 2 3 4 5 6 7 8
do
	echo "Number: $num"
done


for i in {1..20}
do
	echo "The Number is : ${i}"
done

for (( i=1; i<=10; i++))
do
	echo $i
done
