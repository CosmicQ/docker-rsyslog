# Squid3
#
# A VERY simple squid proxy server.

FROM phusion/baseimage:0.9.15
MAINTAINER CosmicQ <cosmicq@cosmicegg.net>

ENV HOME /root
ENV LANG en_US.UTF-8
RUN locale-gen en_US.UTF-8

RUN ln -s -f /bin/true /usr/bin/chfn

# Install Squid
RUN add-apt-repository -y ppa:adiscon/v8-stable
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install rsyslog && apt-get clean

ADD rsyslog.conf /etc/rsyslog.conf
# ADD update_rsyslog.sh /etc/my_init.d/01_update_rsyslog.sh
ADD start_rsyslogd.sh /etc/service/rsyslog/run
RUN rm -rf /etc/service/syslog-ng

EXPOSE 1514
VOLUME ["/var/log/remote"]

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
