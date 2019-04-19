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

# Create "sync-neo4j-ssl.sh" dynamically based on $SSL_DOMAIN and run it:
echo
cat << EOF | tee ./sync-neo4j-ssl.sh
#!/bin/bash
# Certbot post-renewal-hook script that synchronizes SSL certificates for neo4j

# Use 'cp --dereference' to emphasize that we are copying the actual files.
cp --dereference /etc/letsencrypt/live/$SSL_DOMAIN/fullchain.pem /home/ubuntu/ssl/neo4j.cert
cp --dereference /etc/letsencrypt/live/$SSL_DOMAIN/privkey.pem   /home/ubuntu/ssl/neo4j.key

# If hetionet-container is running now, restart it to make the renewal effective.
if [ \`docker ps --quiet --filter name=hetionet-container\` ]; then
    docker restart hetionet-container
fi
EOF
echo

mkdir -p /home/ubuntu/ssl/
chmod +x ./sync-neo4j-ssl.sh
sudo ./sync-neo4j-ssl.sh

# Add post-renewal-hook, see:
# https://certbot.eff.org/docs/using.html#renewing-certificates
sudo cp -f ./sync-neo4j-ssl.sh /etc/letsencrypt/renewal-hooks/post/
