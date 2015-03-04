FROM ubuntu:14.04
MAINTAINER mist.io <support@mist.io>

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y openssh-server python-apt

RUN mkdir /var/run/sshd

RUN sed -ri 's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' /etc/pam.d/sshd

RUN mkdir /root/.ssh

RUN touch /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys

ADD ./init.sh /

EXPOSE 22
ENTRYPOINT cd / && ./init.sh
