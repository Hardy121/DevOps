#!/bin/bash

<<comment
create user with root user only
script will take 1st argument as an user
auto generate password for user
show bellow detail after user is created
	- username : <username>
	- password : <password>
comment

set -eou pipefail

if [[ "${#}" -lt 1 ]];
then
	echo "Usage: ${0} USER_NAME [COMMENT]..."
	echo "Create a user with name USER_NAME and comment field of comment.."
	exit 1
fi

if [[ "${UID}" -ne 0 ]];
then
	echo "Please run script as an root privallages"
	exit 1
fi 

# create user
USER_NAME="${1}"
shift
COMMENT="${@}"
PASSWORD=$(openssl rand -hex 32)


sudo useradd -c "${COMMENT}" -m $USER_NAME

if [[ $? -ne 0 ]];
then
	echo 'The account could not be created'
	exit 1
fi

echo $PASSWORD | sudo passwd --stdin $USER_NAME 

if [[ $? -ne 0 ]];
then
	        echo 'Password could not be set'
		        exit 1
fi

sudo passwd -e $USER_NAME

echo 
echo "Username: $USER_NAME"
echo
echo "Password: $PASSWORD"
echo 
echo "$(hostname)"
