# Neo4j Deployment

This directory includes files to deploy neo4j-hetionet on Ubuntu 18.04 box.

## Prerequisites of Deployment Box:
 - OS: Ubuntu 18.04 or later
 - User account `ubuntu` that has `sudo` privilege

## Deployment Steps:

Open `install_ssl.sh` and set the following two lines correctly:
```shell
EMAIL="foo@bar.org"                 # set email address associated with SSL certificate
SSL_DOMAIN="dhu-foo.greenelab.com"  # set your SSL domain name
```

Then type the following command on the deplyment box:
```shell
./setup.sh
```

Here is a summary of what this script does:
 - Install a daily cron job to upgrade packages using `apt` command
 - Install the latest Docker CE (Community Edition)
 - Install/configure `supervisord`, which runs `Neo4j` container as a daemon
 - Copy docker-related scripts into `/home/ubuntu/docker-scripts/` directory
 - Install SSL certificates issed by [Let's Encrypt](https://letsencrypt.org/)

Reboot the deployment box at the end to ensure that new configurations will become effective.

If you need to reconfigure SSL later, please reset `EMAIL` and `SSL_DOMAIN` as described earlier, then type:
```shell
./install_ssl.sh
```
