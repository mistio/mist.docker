FROM fedora:latest
MAINTAINER mist.io <support@mist.io>

RUN yum update -y

RUN yum install -y openssh-server

RUN sed -ri 's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' /etc/pam.d/sshd

RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

RUN mkdir /var/run/sshd

RUN mkdir /root/.ssh && chmod 700 /root/.ssh

RUN touch /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key

RUN yum install -y wget

ADD ./init.sh /

EXPOSE 22
ENTRYPOINT cd / && ./init.sh