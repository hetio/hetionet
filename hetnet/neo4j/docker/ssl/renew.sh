# stop docker container
TAG="dhimmel/hetionet:hetionet-v1.0_neo4j-3.0.2"
docker rm $(docker stop $(docker ps --all --quiet --filter ancestor=$TAG --format="{{.ID}}"))

# renew certificates
certbot renew --quiet --no-self-upgrade
cp /etc/letsencrypt/live/neo4j.het.io/fullchain.pem ~/ssl/neo4j.cert
cp /etc/letsencrypt/live/neo4j.het.io/privkey.pem ~/ssl/neo4j.key

# start docker
docker run --detach --publish=80:7474 --publish=443:7473 --publish=7687:7687 --volume=$HOME/hetionet-data:/data --volume=$HOME/ssl:/var/lib/neo4j/certificates $TAG
