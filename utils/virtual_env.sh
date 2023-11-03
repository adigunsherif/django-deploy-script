#!/bin/bash
# Bash script to update Ubuntu, install packages


# Check if one argument is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory_name> $1 <git directory"
    exit 1
fi

# Directory and repository information
directory_name="$1"
repository_url="$2"

# Create a directory with the given name and navigate into it
mkdir "$directory_name"
cd "$directory_name"

# Create a Python virtual environment with the same name as the directory
envdirectory="$directory_nameenv"
python3 -m venv "$envdirectory"

# Clone the Bitbucket repository
git clone "$repository_url" .

repository_name=$(basename "$repository_url" .git)
repository_folder="${repository_name##*/}"

# Assuming that requirements.txt is located inside the repository_folder
requirements_file="$repository_folder/requirements.txt"

# Check if the requirements file exists
if [ -f "$requirements_file" ]; then
    # Activate the virtual environment
    source "$envdirectory/bin/activate"

    # Install the requirements from requirements.txt
    pip install -r "$requirements_file"

    # Deactivate the virtual environment
    deactivate
else
    echo "requirements.txt file not found inside $repository_folder."
fi