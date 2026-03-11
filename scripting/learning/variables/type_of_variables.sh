
#!/bin/bash

#variables example

age=22
name="Hardik"


echo "i am $name and my age is ${age} and i am using $HOSTNAME"

# Variables can be redeclare
name="john"
age=0

echo "i am $name and my age is $age"



# Commands output can also be stored inside Variable
HOSTNAME=$(hostname)



# Constant variables
readonly clg="hello"
echo "$clg"
#clg="world"


# Remove variables
unset name
echo "name is $name"
