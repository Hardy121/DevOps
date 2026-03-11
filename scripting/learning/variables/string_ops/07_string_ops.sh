#!/bin/bash


myVar="Hello everyone! How are you."

myVarLength=${#myVar}

echo "the length of string is $myVarLength"


echo "The upper case ---------${myVar^^}"
echo "The Lower case ---------${myVar,,}"


echo "replace word -----------${myVar/everyone/world}"


echo "Slice word --------------${myVar:6:10}"
