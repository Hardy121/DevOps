#!/bin/bash


arr=("banana" 1 "banana" 2 3 banana 4 banana)

echo "${#arr[*]}"

echo "${arr[*]:3}"

echo "${arr[*]:3:1}"


arr+=(5 banana)
echo "${arr[*]}"
