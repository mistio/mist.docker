FROM debian:wheezy
MAINTAINER mist.io <support@mist.io>

RUN apt-get update

RUN apt-get install -y openssh-server python python-apt

RUN mkdir /var/run/sshd

RUN mkdir /root/.ssh

RUN touch /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys

ADD ./init.sh /

RUN apt-get install -y wget

EXPOSE 22
ENTRYPOINT cd / && ./init.sh
