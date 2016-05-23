## Building the docker

```sh
docker build --tag dhimmel/hetionet:hetionet-v1.0_neo4j-3.0.1 --file Dockerfile .
```

## Running the docker

```sh
docker run --detach --publish=7474:7474 $IMAGE
```

## On docker hub

https://hub.docker.com/r/dhimmel/hetionet/

## Browse live instance at

http://neo4j.het.io:7474/
