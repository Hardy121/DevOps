#!/bin/bash

# Array

array=(1 20 30.5 hello "hey buddy!")

# Get specific values from array
echo "${array[3]}"

# Get all values from array
echo "all value is ${array[*]}"
echo "all value is ${array[@]}"

# Get Length of array
echo "Length of array is ${#array[*]}"


# Get values from specific index to all
echo "the value from 2 ${array[*]:2}"

# Get value in range from one index to another
echo "The value from 2 to 4 ${array[*]:2:4}"


# Update array and add more values inside
array+=(Newadded 10 20)

echo "after array updated ${array[*]}"


# Key value pairs

declare -A keyValuePairs
keyValuePairs=( [name]=hardik [age]=20 [city]=surat)

echo "the name of user is ${keyValuePairs[name]}"
echo "the city of user is ${keyValuePairs[city]}"
