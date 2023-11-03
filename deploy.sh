#!/bin/bash


# Check the number of provided arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <directory_name> <githubcodeurl> <arg3>"
    exit 1
fi

arg1="$1"
arg2="$2"
arg3="$3"

# Update the server
bash ./utils/server_update.sh 

# Setup Virtual Environments 
bash ./utils/virtual_env.sh  "$arg1" "$arg2"

# Setup Virtual Environments 
bash ./utils/gunicorn.sh  "$arg1"  "$arg2" 