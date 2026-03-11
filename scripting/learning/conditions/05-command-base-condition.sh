#!/bin/bash


if ping -c 1 google.com
then
	echo "Internet is working"
else
	echo "No Internet"
fi
