FROM debian:bullseye
MAINTAINER mist.io <support@mist.io>

RUN apt-get update && apt-get install -y openssh-server curl && \
    mkdir /var/run/sshd && mkdir /root/.ssh && \
    touch /root/.ssh/authorized_keys && \
    chmod 600 /root/.ssh/authorized_keys && \
    rm -rf /var/lib/apt/lists/*

ADD ./init.sh /

EXPOSE 22

ENTRYPOINT cd / && ./init.sh
