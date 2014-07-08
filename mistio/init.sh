#!/bin/sh

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

./bin/buildout -vN
./bin/supervisord

tail -f var/log/uwsgi-std*
eof
