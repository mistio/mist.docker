FROM alpine
MAINTAINER mist.io <support@mist.io>

RUN apk update && apk add openssh collectd

RUN mkdir /root/.ssh

RUN touch /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys

RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa

RUN sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && sed -i "s/#AuthorizedKeysFile/AuthorizedKeysFile/g" /etc/ssh/sshd_config

ADD init.sh /init.sh

RUN rm -rf /var/cache/apk/*

CMD ["sh", "/init.sh"]
