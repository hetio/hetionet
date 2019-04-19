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

# Create "sync-neo4j-ssl.sh" dynamically based on $SSL_DOMAIN
rm -rf ./sync-neo4j-ssl.sh
echo "#!/bin/bash" >> ./sync-neo4j-ssl.sh
echo "# Certbot post-renewal-hook script that synchronizes SSL certificates for neo4j" \
     >> ./sync-neo4j-ssl.sh
echo >> ./sync-neo4j-ssl.sh
echo "# Use 'cp --dereference' to emphasize that we are copying the actual files." \
     >> ./sync-neo4j-ssl.sh
SSL_DIR=/etc/letsencrypt/live/$SSL_DOMAIN
echo "cp --dereference $SSL_DIR/fullchain.pem /home/ubuntu/ssl/neo4j.cert" >> ./sync-neo4j-ssl.sh
echo "cp --dereference $SSL_DIR/privkey.pem   /home/ubuntu/ssl/neo4j.key"  >> ./sync-neo4j-ssl.sh

mkdir -p /home/ubuntu/ssl/
chmod +x ./sync-neo4j-ssl.sh
sudo ./sync-neo4j-ssl.sh

# Add post-renewal-hook, see:
# https://certbot.eff.org/docs/using.html#renewing-certificates
sudo cp -f ./sync-neo4j-ssl.sh /etc/letsencrypt/renewal-hooks/post/
