#!/bin/bash

chown mist /
chown -R mist /home/mist/mist.io

if [ -z $BRANCH ]; then
    BRANCH=master
fi

exec sudo -u mist /bin/bash - << eof

cd /home/mist/mist.io
git checkout $BRANCH
git pull

cd src/libcloud
git pull
cd -
/usr/lib/erlang/erts-5.10.4/bin/epmd -daemon
sed -i s/"frontend www localhost:8000"/"frontend www 0.0.0.0:8000"/g haproxy.conf
sed -i s/localhost/127.0.0.1/g haproxy.conf

./bin/supervisord

tail -f var/log/*
eof
