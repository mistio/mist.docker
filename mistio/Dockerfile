FROM ubuntu:14.04
MAINTAINER mist.io <support@mist.io>

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y git python-dev python-virtualenv && \
  apt-get install -y erlang libpcre3-dev

RUN useradd mist -m -d /home/mist

USER mist
RUN cd /home/mist && git clone https://github.com/mistio/mist.io
WORKDIR /home/mist/mist.io
RUN virtualenv --no-site-packages .
RUN ./bin/python bootstrap.py
RUN ./bin/buildout -v
RUN echo JS_BUILD = True >> settings.py
RUN echo CSS_BUILD = True >> settings.py
RUN echo SSL_VERIFY = False >> settings.py


USER root
ADD ./init.sh /
EXPOSE 8000
ENTRYPOINT /init.sh
