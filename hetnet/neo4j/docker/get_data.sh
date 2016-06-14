#!/bin/sh

cd /data/databases

if [ ! -d "graph.db" ]; then
  echo "Downloading and extracting database"
  DB_URL="https://github.com/dhimmel/hetionet/raw/neo4j-3.0/hetnet/neo4j/hetionet-v1.0.db.tar.bz2"
  curl --location $DB_URL | tar --extract --bzip2
else
  echo "Not retrieving database as it already exists"
fi

if [ ! -d "/data/guides" ]; then
  echo "Importing guides"
  cp --recursive /guides /data
else
  echo "Not retrieving guides as they already exist"
fi
