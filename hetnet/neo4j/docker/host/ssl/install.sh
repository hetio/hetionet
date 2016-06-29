## Instructions for installing ssh via Let's Encrypt on the Digital Ocean
## Ubuntu 14.04 Docker droplet

# Install miniconda for a newer Python 2.7 to avoid the error
# InsecurePlatformWarning: A true SSLContext object is not available. This prevents urllib3 from configuring SSL appropriately and may cause certain SSL connections to fail. For more information, see https://urllib3.readthedocs.org/en/latest/security.html#insecureplatformwarning.
wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
bash Miniconda2-latest-Linux-x86_64.sh
rm Miniconda2-latest-Linux-x86_64.sh

# Reload shell so conda is available
conda install cryptography ndg-httpsclient
pip install urllib3
pip intall certbot

# This script installs ssh on Ubuntu 14.04 using let's encrypt
# Follow instructions
certbot certonly --standalone

# Create a directory to map as a docker volume
mkdir ~/ssl
cp /etc/letsencrypt/live/neo4j.het.io/fullchain.pem ~/ssl/neo4j.cert
cp /etc/letsencrypt/live/neo4j.het.io/privkey.pem ~/ssl/neo4j.key

# Make sure to move renew.sh to ~/ssh/
# Schedule renewal with `crontab -e`
# `@monthly sh /root/ssl/renew.sh`
