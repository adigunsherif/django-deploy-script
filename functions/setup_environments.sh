#!/bin/bash
# Bash script to update Ubuntu, install packages


# Check if one argument is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory_name> $1 <git directoryory"
    exit 1
fi

# Directory and repository information
directory_name="$1"
repository_url="$2"

# Create a directory with the given name and navigate into it
mkdir "$directory_name"
cd "$directory_name"

# Create a Python virtual environment with the same name as the directory
python3 -m venv "$directory_name"