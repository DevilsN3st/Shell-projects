#!/bin/bash

if [[ "$UID" -ne 0 ]]
then
    echo "Permission denied"
    exit 1
fi

if [[ "#" -lt 1 ]]
then
    echo "Usage: ${0} username [Comment]..."
    echo "Create a user with user username and comments field of Comment"
    exit 1
fi

USER_NAME = "${1}"
echo $USER_NAME

shift
COMMENT: "${@}"

PASSWORD = $(date +%s%N)

useradd -c "$COMMENT" -m $USER_NAME

if [[ $? -ne 0 ]]
then
    echo 'The account was not created successfully'
    exit 1
fi

echo $PASSWORD passwd --stdin $USER_NAME

if [[ $? -ne 0 ]]
then
    echo 'The account was not created successfully'
    exit 1
fi

passwd -e $USER_NAME

echo 
echo "Username: $USER_NAME"
echo
echo "Password: $PASSWORD"
echo 
echo "Hostname: $(hostname)"

