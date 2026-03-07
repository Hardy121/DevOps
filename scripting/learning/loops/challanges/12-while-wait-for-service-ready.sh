#!/bin/bash



while ! curl -sf https://www.google.com > /dev/null; 
do
	echo "Waiting for service...."
	sleep 2
done
