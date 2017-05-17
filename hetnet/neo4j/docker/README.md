# Docker to host Hetionet in Neo4j at https://neo4j.het.io

This Docker image hosts Hetionet in a publicly accessible Neo4j instance. The image is on [Docker hub as `dhimmel/hetionet`](https://hub.docker.com/r/dhimmel/hetionet/) and the live container is available at https://neo4j.het.io.

The image is highly specialized for our application and setup. For example, it includes a website-specific web analytics javascript. You can learn more our [customizations here](https://thinklab.com/discussion/hosting-hetionet-in-the-cloud-creating-a-public-neo4j-instance/216). If you are simply looking to run a local Neo4j instance with Hetionet, you may find it easier to start with the [database store](../) only rather than this Docker.

The contents of this repository are mostly included in the Docker image. However, the [`host`](host) contains files that are meant for the cloud host running the Docker virtual machine.

## Building the docker

Build the image using the following command:

```sh
TAG="dhimmel/hetionet:hetionet-v1.0_neo4j-3.1.4"
docker build --tag dhimmel/hetionet:latest --tag $TAG --file Dockerfile .
```

When the image is ready, it's uploaded to Docker hub using `docker push dhimmel/hetionet`.

## Running the docker

To run the image on a local system, (development or local usage) run the following:

```sh
docker run \
  --name=hetionet-container \
  --publish=7474:7474 \
  --publish=7687:7687 \
  --volume=$HOME/neo4j/hetionet-data:/data \
  --volume=$HOME/neo4j/hetionet-logs:/logs \
  dhimmel/hetionet
```

## Deploying the docker

From the cloud host, first pull the docker `docker pull dhimmel/hetionet` and then start the docker `sh ~/run-docker.sh`. `run-docker.sh` should be copied from [`host/run-docker.sh`](host/run-docker.sh) in this repository into $HOME on the cloud host.
