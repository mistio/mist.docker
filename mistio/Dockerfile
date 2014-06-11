FROM ubuntu:14.04
MAINTAINER mist.io <support@mist.io>

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y git python-dev python-virtualenv

RUN git clone https://github.com/mistio/mist.io

WORKDIR /mist.io
RUN echo JS_BUILD = True >> settings.py
RUN echo CSS_BUILD = True >> settings.py
RUN echo SSL_VERIFY = False >> settings.py

RUN virtualenv --no-site-packages .
RUN ./bin/pip install --upgrade setuptools
RUN ./bin/python bootstrap.py
RUN ./bin/buildout -v

ADD ./init.sh /
EXPOSE 6543
ENTRYPOINT cd / && ./init.sh