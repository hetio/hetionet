# On the Digital Ocean Droplet: Ubuntu Docker 17.05.0-ce on 16.04
# Let's Encrypt comes installed.
# The most recent version can also be installed via
add-apt-repository ppa:certbot/certbot
apt-get update
apt-get install certbot

# Configure by running:
certbot certonly --standalone --domain neo4j.het.io

# Consider adding --staging for testing until certificate registration succeeds.
# Staging has higher rate limits, but does not produce recognized certificates.
