#!/bin/bash


# Check the number of provided arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <arg1> <arg2> <arg3>"
    exit 1
fi

arg1="$1"
arg2="$2"
arg3="$3"

# Update the server
bash ./functions/update_server.sh 


# Setup Virtual Environments 
bash ./functions/setup_environments.sh  "$arg1"