#!/bin/bash

<< comment
Write a script that:
Asks user for password
Keeps asking until correct password is entered
If correct → break loop
comment

password="1111"
read -p "Enter your password " enteredPass

until (( password == enteredPass ))
	
do
	read -p "Enter your password " enteredPass
done

