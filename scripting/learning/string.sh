#!/bin/bash

set -u


myvar="hello everyone hello wolrd"

echo "$my"

echo "lenght ${#myvar}"

echo "uppercase = ${myvar^^}"
echo "Lowercase = ${myvar,,}"

echo "hiii = ${myvar/hello/hii}"

echo "slice word = ${myvar:6:10}"
