#!/bin/bash
#
# This script manually updates the Docker image and restarts hetionet container.

# Run the script as user "ubuntu" only.
if [ `whoami` != 'ubuntu' ]; then
    echo "Error: only the user 'ubuntu' is allowed to run this script."
    exit 1
fi

# Ensure that working directory is correct.
cd `dirname $0`

# Stop docker container
bash ./stop-docker.sh

# Pull the latest docker image
docker pull dhimmel/hetionet

# Start docker
bash ./run-docker.sh
