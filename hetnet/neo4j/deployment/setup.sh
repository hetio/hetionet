#!/bin/bash
#
# This shell script deploys neo4j-hetionet web server on Ubuntu 18.04.

# Run the script as user "ubuntu" only.
if [ `whoami` != 'ubuntu' ]; then
    echo "Error: only the user 'ubuntu' is allowed to run this script."
    exit 1
fi

# Ensure that the working directory is correct
cd `dirname $0`

# Update packages automatically using a daily cron job
sudo apt update
sudo apt purge unattended-upgrades --yes
sudo rm -rf /var/log/unattended-upgrades/
sudo cp upgrade-pkg /etc/cron.daily/
sudo chmod 755 /etc/cron.daily/upgrade-pkg

# "root" bash config
sudo cp -f bash_aliases /root/.bash_aliases
sudo bash -c "cat root_bash_prompt >> /root/.bashrc"

# "ubuntu" bash config
cp -f bash_aliases ~/.bash_aliases

# Customize hostname
sudo bash -c "echo neo4j-hetionet > /etc/hostname"

# Install the latest Docker CE (Community Edition)
sudo apt install apt-transport-https gnupg-agent --yes
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io --yes
sudo usermod -aG docker ubuntu   # ensure that "ubuntu" account can run docker w/o "sudo"

# Collect docker-related scripts into one directory
mkdir -p ~/docker-scripts/
cp -f start-docker.sh stop-docker.sh update-docker.sh neo4j-supervisor.sh ~/docker-scripts/

# Use supervisord to start neo4j-hetionet container at boot time
sudo apt install supervisor --yes
sudo systemctl stop supervisor
sudo cp -f neo4j-docker.conf /etc/supervisor/conf.d/

# Install SSL certificates issued by Let's Encrypt
bash ./install_ssl.sh
