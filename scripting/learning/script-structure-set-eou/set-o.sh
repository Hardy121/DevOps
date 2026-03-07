#!/bin/bash

set -o

cat missing.txt | grep something

echo "hello world"
echo $?
