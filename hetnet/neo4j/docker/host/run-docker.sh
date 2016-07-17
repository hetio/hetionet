# Start dhimmel/hetionet container
# See https://neo4j.com/developer/docker-3.x/ for doc
docker run \
  --detach \
  --publish=80:7474 \
  --publish=443:7473 \
  --publish=7687:7687 \
  --volume=$HOME/hetionet-data:/data \
  --volume=$HOME/neo4j-logs:/var/lib/neo4j/logs \
  --volume=$HOME/ssl:/var/lib/neo4j/certificates \
  --env=NEO4J_dbms_memory_pagecache_size=1G \
  --env=NEO4J_dbms_memory_heap_maxSize=512 \
  dhimmel/hetionet
