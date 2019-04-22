#!/bin/bash
#
# Update the Docker image and restart hetionet container.

# Ensure that working directory is correct.
cd `dirname $0`

# Stop docker container
bash ./stop-docker.sh

# Pull the latest docker image
docker pull dhimmel/hetionet

# Start docker
bash ./run-docker.sh
