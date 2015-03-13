docker-rsyslog
==============

A simple rsyslog server for central log collection or distribution.


The rsyslog process listens on port 1514 in the container.  You can 
map this to any port you want on the host with the -p option

A volume has been defined for /var/log/remote where the remote host 
syslog messages live.  You can attach this to a directory on the 
host to maintain persistance on the log files.

### Before you run: ###

    mkdir /srv/syslog
    chmod 777 /srv/syslog

### To start: ###

    docker run -d -p 1514:1514 \
    -p 1514:1514/udp \
    -v /srv/syslog:/var/log/remote \
    --name=rsyslog
    --hostname=rsyslog
    cosmicq/docker-rsyslog

On the servers add this line to /etc/rsyslog.conf

    *.*     @@192.168.1.2:1514

Adjust the IP address to the external IP address of your server/host

Once it's started, you can set the permissions on the directory to
be owned by the UID that creates the host directories.
