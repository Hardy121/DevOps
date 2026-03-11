
#!/bin/bash

read -p "Enter number for multiplication " number

for (( i=1; i<=10; i++ ))
do
	echo "$number x $i = $(( i * number )) "
done
