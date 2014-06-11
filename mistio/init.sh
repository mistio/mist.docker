#!/bin/sh

if [ -z $BRANCH ]; then
    BRANCH=master
fi

cd /mist.io
git checkout $BRANCH
git pull

cd src/libcloud
git pull
cd -

./bin/buildout -vN
./bin/paster serve development.ini