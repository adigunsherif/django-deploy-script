#!/bin/bash
# Bash script to update Ubuntu, install packages

# Update Ubuntu and install required packages
sudo apt update
sudo apt install -y python3-venv python3-dev libpq-dev nginx curl build-essential
