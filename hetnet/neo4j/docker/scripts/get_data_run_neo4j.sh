#!/bin/sh
sh /get_data.sh
export NEO4J_EDITION=community
/docker-entrypoint.sh neo4j
