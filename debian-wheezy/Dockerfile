FROM debian:wheezy
MAINTAINER mist.io <support@mist.io>

RUN apt-get update && \
    apt-get install -y \
        wget \
        openssh-server \
        python \
        python-apt \
        collectd && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /var/run/sshd && \
    mkdir /root/.ssh && \
    touch /root/.ssh/authorized_keys && \
    chmod 600 /root/.ssh/authorized_keys

ADD ./init.sh /

EXPOSE 22

ENTRYPOINT /init.sh
