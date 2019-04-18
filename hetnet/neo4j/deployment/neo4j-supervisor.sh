#!/bin/bash
#
# This script is called by /etc/supervisor/conf.d/neo4j-docker.conf
# to update the docker image and restart hetionet container.
#
# Because this process is maintained by supervisor as a daemon, the
# "docker run" command doesn't have "--detach" or "--restart=on-failure"
# options. (Both options are used in "start-docker.sh" script.)
#
# THIS SCRIPT SHOULD NOT BE RUN DIRECTLY ON COMMAND LINE.

# Stop and remove "hetionet-container"
if [ `docker ps --quiet --filter name=hetionet-container` ]; then
  docker rm hetionet-container --force --quiet
fi

# Pull the latest docker image
docker pull dhimmel/hetionet

# Restart neo4j docker container
# See https://neo4j.com/developer/docker-3.x/ for doc
docker run \
  --name=hetionet-container \
  --publish=80:7474 \
  --publish=443:7473 \
  --publish=7687:7687 \
  --volume=/home/ubuntu/hetionet-data:/data \
  --volume=/home/ubuntu/neo4j-logs:/logs \
  --volume=/home/ubuntu/ssl:/ssl \
  --env=NEO4J_dbms_memory_pagecache_size=512m \
  --env=NEO4J_dbms_memory_heap_maxSize=1g \
  dhimmel/hetionet
