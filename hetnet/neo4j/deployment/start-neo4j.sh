#!/bin/bash
# Certbot post-renewal-hook script, which starts neo4j docker container.

if [ -z $(docker ps --quiet --filter name=hetionet-container) ]; then
    docker start hetionet-container
fi
