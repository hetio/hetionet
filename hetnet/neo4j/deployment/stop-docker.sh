#!/bin/bash
#
# Stop and remove the Docker hetionet-container.

if [ `docker ps --all --quiet --filter name=hetionet-container` ]; then
    echo -n "Deleting "
    docker rm hetionet-container --force
fi
