# Start dhimmel/hetionet container
docker run \
  --publish=80:7474 \
  --publish=443:7473 \
  --publish=7687:7687 \
  --volume=$HOME/hetionet-data:/data \
  --volume=$HOME/neo4j-logs:/var/lib/neo4j/logs \
  --volume=$HOME/ssl:/var/lib/neo4j/certificates \
  dhimmel/hetionet
