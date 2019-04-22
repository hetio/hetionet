#!/bin/bash
#
# Start dhimmel/hetionet container.
# See https://neo4j.com/developer/docker-3.x/ for doc

docker run \
  --detach \
  --name=hetionet-container \
  --restart=on-failure \
  --publish=80:7474 \
  --publish=443:7473 \
  --publish=7687:7687 \
  --volume=/home/ubuntu/hetionet-data:/data \
  --volume=/home/ubuntu/neo4j-logs:/logs \
  --volume=/home/ubuntu/ssl:/ssl \
  --env=NEO4J_dbms_memory_pagecache_size=512m \
  --env=NEO4J_dbms_memory_heap_maxSize=1g \
  dhimmel/hetionet
