cd ~/

# print a separator line
printf '%79s\n' | tr ' ' '#'

# output date
date --iso-8601=seconds --universal

# stop docker container
sh stop-docker.sh

# renew certificates
certbot renew --non-interactive --no-self-upgrade
cp /etc/letsencrypt/live/neo4j.het.io/fullchain.pem ~/ssl/neo4j.cert
cp /etc/letsencrypt/live/neo4j.het.io/privkey.pem ~/ssl/neo4j.key

# start docker
sh run-docker.sh
