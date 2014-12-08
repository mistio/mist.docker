FROM centos:latest
MAINTAINER mist.io <support@mist.io>

RUN yum update -y

RUN yum install -y openssh-server sudo

RUN mkdir -p /var/run/sshd ; chmod -rx /var/run/sshd

RUN mkdir /root/.ssh

RUN touch /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys

RUN chmod 700 /root/.ssh

RUN chmod 600 /root/.ssh/*

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

ADD ./init.sh /

RUN chmod 777 ./init.sh

ADD sshd_config /etc/ssh/sshd_config

RUN echo 'root:secret' | chpasswd

EXPOSE 22
ENTRYPOINT cd / && ./init.sh