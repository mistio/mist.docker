FROM alpine
MAINTAINER mist.io <support@mist.io>

RUN apk update && apk add openssh collectd

RUN mkdir /root/.ssh

RUN touch /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys

ADD init.sh /init.sh

RUN rm -rf /var/cache/apk/*

CMD ["sh", "/init.sh"]
