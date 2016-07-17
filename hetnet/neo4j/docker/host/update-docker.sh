# Update the Docker image, restarts the container

cd ~/

# stop docker container
sh stop-docker.sh

# Pull the latest docker image
docker pull dhimmel/hetionet

# start docker
sh run-docker.sh
