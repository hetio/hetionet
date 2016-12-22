#!/bin/sh

# Exit on error
set -o errexit

cd /data

mkdir -p databases
if [ ! -d "databases/graph.db" ]; then
  echo "Downloading and extracting database"
  DB_URL="https://github.com/dhimmel/hetionet/raw/e319b1b50639b845a35e31fbc16afcbe9b8c2dfd/hetnet/neo4j/hetionet-v1.0.db.tar.bz2"
  curl --silent --location $DB_URL | tar --extract --bzip2 --directory=databases
else
  echo "Not retrieving database as it already exists"
fi

if [ ! -d "guides" ]; then
  echo "Downloading and extracting guides"
  cp --recursive /guides ./
  GUIDES_URL="https://github.com/dhimmel/het.io-rep-guides/raw/4837f3dcdcdb56b14fdc2b998c8571ae7aad6b36/guides.tar.bz2"
  mkdir guides/rep
  curl --silent --location $GUIDES_URL | tar --extract --bzip2 --strip-components=1 --directory=guides/rep
else
  echo "Not retrieving guides as they already exist"
fi
