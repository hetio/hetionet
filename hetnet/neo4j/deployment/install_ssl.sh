#!/bin/bash
#
# This script uses certbot to install SSL certificates issued by Let's Encrypt.

# Ensure that working directory is correct
cd `dirname $0`

if [ ! -x /usr/bin/certbot ]; then
    sudo add-apt-repository ppa:certbot/certbot --yes
    sudo apt update
    sudo apt install certbot --yes
fi

EMAIL="team@greenelab.com" # email address associated with SSL certificate
SSL_DOMAIN="neo4j.het.io"  # SSL domain name

sudo certbot certonly \
     --standalone \
     --agree-tos \
     --noninteractive \
     --email $EMAIL \
     --no-eff-email \
     --domain $SSL_DOMAIN

# Create "sync-neo4j-ssl.sh" dynamically and run it:
cat > ./sync-neo4j-ssl.sh << EOF
#!/bin/bash
# Certbot deploy-renewal-hook script, which synchronizes SSL certificates for neo4j.
# This script will be executed ONLY WHEN certificate is renewed successfully.

# Use 'cp --dereference' to emphasize that we are copying the actual files.
cp --dereference --force /etc/letsencrypt/live/$SSL_DOMAIN/fullchain.pem /home/ubuntu/ssl/neo4j.cert
cp --dereference --force /etc/letsencrypt/live/$SSL_DOMAIN/privkey.pem   /home/ubuntu/ssl/neo4j.key
# neo4j docker users neo4j user with id 101 and must be able to read neo4j.key. See https://github.com/hetio/hetionet/pull/26#issuecomment-547090526
chmod 644 /home/ubuntu/ssl/neo4j.key
EOF

mkdir -p /home/ubuntu/ssl/
chmod +x ./sync-neo4j-ssl.sh
sudo ./sync-neo4j-ssl.sh

# If hetionet-container is running now, restart it to make the new certificates effective.
if [ -n $(docker ps --quiet --filter name=hetionet-container) ]; then
    echo -n "Restarting "
    docker restart hetionet-container
fi

# Add renewal-hooks scripts, see:
# https://certbot.eff.org/docs/using.html#renewing-certificates
sudo cp --force ./stop-neo4j.sh /etc/letsencrypt/renewal-hooks/pre/
sudo cp --force ./sync-neo4j-ssl.sh /etc/letsencrypt/renewal-hooks/deploy/
sudo cp --force ./start-neo4j.sh /etc/letsencrypt/renewal-hooks/post/
