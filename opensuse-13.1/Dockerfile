FROM mmckeen/opensuse-13-1
MAINTAINER mist.io <support@mist.io>

RUN zypper update -y

RUN zypper install -y openssh

RUN mkdir /var/run/sshd

RUN sed -ri 's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' /etc/pam.d/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key

RUN mkdir /root/.ssh

RUN touch /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys

RUN zypper install -y wget

ADD ./init.sh /

EXPOSE 22
ENTRYPOINT cd / && ./init.sh
