cd ~/

# stop docker container
sh stop-docker.sh

# renew certificates
certbot renew --quiet --no-self-upgrade
cp /etc/letsencrypt/live/neo4j.het.io/fullchain.pem ~/ssl/neo4j.cert
cp /etc/letsencrypt/live/neo4j.het.io/privkey.pem ~/ssl/neo4j.key

# start docker
sh run-docker.sh
