#!/bin/sh

# Exit on error
set -o errexit

cd /data

mkdir -p databases
HETIONET_DUMP=hetionet-v1.0-neo4j.dump
if [ ! -f "$HETIONET_DUMP" ]; then
  echo "Downloading database dump"
  DB_URL="https://github.com/hetio/hetionet/raw/030e44430f168d934c44860ad5a9512deb7c7175/hetnet/neo4j/$HETIONET_DUMP"
  wget "$DB_URL"
  # curl --silent --location $DB_URL | neo4j-admin load --from=- --database=hetionet --force
else
  echo "Not retrieving database as it already exists"
fi

# Loading takes seconds, so 
neo4j-admin load --from="$HETIONET_DUMP" --database=hetionet --force

if [ ! -d "guides" ]; then
  echo "Downloading and extracting guides"
  cp --recursive /guides ./
  GUIDES_URL="https://github.com/dhimmel/het.io-rep-guides/raw/4837f3dcdcdb56b14fdc2b998c8571ae7aad6b36/guides.tar.bz2"
  mkdir guides/rep
  curl --silent --location $GUIDES_URL | tar --extract --bzip2 --strip-components=1 --directory=guides/rep
else
  echo "Not retrieving guides as they already exist"
fi
