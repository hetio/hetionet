#!/bin/bash
#
# Stop and remove the Docker hetionet-container manually

if [ -f /bin/systemctl ]; then
  sudo systemctl stop supervisor
fi

if [ `docker ps --quiet --filter name=hetionet-container` ]; then
  docker rm hetionet-container --force
fi
