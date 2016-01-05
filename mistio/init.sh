#!/bin/bash

if [ -z $BRANCH ]; then
    BRANCH=master
fi


cd /home/mist/mist.io
git checkout $BRANCH
git pull

cd src/libcloud
git pull
cd -
sed -i s/"frontend www localhost:8000"/"frontend www 0.0.0.0:8000"/g haproxy.conf
sed -i s/localhost/127.0.0.1/g haproxy.conf

./bin/supervisord

tail -f var/log/*
