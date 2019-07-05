#!/bin/bash
# Certbot pre-renewal-hook script, which stops neo4j docker container.

if [ -n $(docker ps --quiet --filter name=hetionet-container) ]; then
    docker stop hetionet-container
fi
