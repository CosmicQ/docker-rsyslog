docker-rsyslog
==============

A simple rsyslog server for central log collection or distribution.


The rsyslog process listens on port 1514 in the container.  You can 
map this to any port you want on the host with the -p option

A volume has been defined for /var/log/remote where the remote host 
syslog messages live.  You can attach this to a directory on the 
host to maintain persistance on the log files.
