#!/bin/bash

# If the user does not supply at least one argument, then give them help
if [ $# -lt 1 ]; then
    echo "You need to add a user name."
    exit 1
fi

# Get the first argument passed to the script and store it in a variable called user
user=$1

## Run du -a /home/{user} | sort -n -r | head -n 20
du -a /home/$user | sort -n -r | head -n 20
