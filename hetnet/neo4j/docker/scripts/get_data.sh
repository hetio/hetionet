#!/bin/sh

# Exit on error
set -o errexit

cd /data

mkdir -p databases
if [ ! -d "databases/graph.db" ]; then
  echo "Downloading and extracting database"
  DB_URL="https://github.com/dhimmel/hetionet/raw/neo4j-3.0/hetnet/neo4j/hetionet-v1.0.db.tar.bz2"
  curl --silent --location $DB_URL | tar --extract --bzip2 --directory=databases
else
  echo "Not retrieving database as it already exists"
fi

if [ ! -d "guides" ]; then
  echo "Downloading and extracting guides"
  cp --recursive /guides ./
  GUIDES_URL="https://github.com/dhimmel/het.io-rep-guides/raw/fe74cd6db34cddc379f789e5ce5fe6b2c32abf2d/guides.tar.bz2"
  mkdir guides/rep
  curl --silent --location $GUIDES_URL | tar --extract --bzip2 --strip-components=1 --directory=guides/rep
else
  echo "Not retrieving guides as they already exist"
fi
