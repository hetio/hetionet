# Files for administering the Docker on its host

The contents of this directory can be copied into `$HOME` on the cloud host.

`run-docker.sh` and `stop-docker.sh` start and stop the container.

## SSL

`ssl` contains information on requesting and renewing the SSL certificate.

On the host system, create an `ssl` directory in home and copy over [`renew.sh`](ssl/renew.sh).

SSL renewal can be scheduled to execute every fortnight (1st and 16th of each month at 4:00 AM) using cron. To do so, run `crontab -e` and add the following line:

```
0 4 1,16 * *  sh /root/ssl/renew.sh >> /root/ssl/cron-renew.log
```

## Download this directory

You can download the contents of this directory from GitHub to the current working directory, using subversion:

```sh
svn export --force https://github.com/dhimmel/hetionet.git/trunk/hetnet/neo4j/docker/host/ .
```
