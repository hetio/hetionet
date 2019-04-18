#!/bin/bash
#
# Start dhimmel/hetionet container manually.
# See https://neo4j.com/developer/docker-3.x/ for doc

# Run the script as user "ubuntu" only.
if [ `whoami` != 'ubuntu' ]; then
    echo "Error: only the user 'ubuntu' is allowed to run this script."
    exit 1
fi

docker run \
  --detach \
  --name=hetionet-container \
  --restart=on-failure \
  --publish=80:7474 \
  --publish=443:7473 \
  --publish=7687:7687 \
  --volume=$HOME/hetionet-data:/data \
  --volume=$HOME/neo4j-logs:/logs \
  --volume=$HOME/ssl:/ssl \
  --env=NEO4J_dbms_memory_pagecache_size=512m \
  --env=NEO4J_dbms_memory_heap_maxSize=1g \
  dhimmel/hetionet
