FROM ubuntu:14.04
MAINTAINER mist.io <support@mist.io>

RUN apt-get update && apt-get install -y collectd build-essential sudo vim && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN mkdir -p /opt/mistio-collectd

ADD collectd.conf /opt/mistio-collectd/collectd.conf

ADD collectd.sh /opt/mistio-collectd/collectd.sh

ADD uuid /opt/mistio-collectd/uuid

RUN chmod +x /opt/mistio-collectd/collectd.sh

RUN mkdir -p /mnt/host

RUN useradd mist -m -d /home/mist && adduser mist sudo

ADD 90-mist-users /etc/sudoers.d/90-mist-users

ADD collectd-docker.sh /usr/share/collectd/collectd-docker.sh

RUN chmod +x /usr/share/collectd/collectd-docker.sh

ADD entrypoint.sh /

RUN chmod +x /entrypoint.sh

RUN touch /var/log/collectd.log 

ENTRYPOINT ["/entrypoint.sh"]
