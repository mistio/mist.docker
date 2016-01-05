FROM debian:7
MAINTAINER mist.io <support@mist.io>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get install -y build-essential && \
  apt-get install -y git python-dev python-virtualenv && \
  apt-get install -y erlang erlang-nox libpcre3-dev && \
  apt-get install -y libvirt-bin libvirt-dev pkg-config

RUN useradd mist -m -d /home/mist

USER mist
RUN cd /home/mist && git clone https://github.com/mistio/mist.io
WORKDIR /home/mist/mist.io
RUN virtualenv --no-site-packages .
RUN ./bin/pip install --upgrade setuptools
RUN ./bin/python bootstrap.py
RUN ./bin/buildout -v
RUN echo JS_BUILD = True >> settings.py
RUN echo CSS_BUILD = True >> settings.py
RUN echo SSL_VERIFY = False >> settings.py
RUN ./bin/pip install ansible

RUN cd /home/mist/mist.io && ./bin/pip install libvirt-python pyvmomi

USER root
ADD init.sh /init.sh
RUN chmod +x /init.sh && chown mist /init.sh

USER mist
EXPOSE 8000
ENTRYPOINT /init.sh
