#!/bin/bash

if [ -n "$PUBLIC_KEY" ] && ! grep $PUBLIC_KEY /root/.ssh/authorized_keys; then
    echo $PUBLIC_KEY >> /root/.ssh/authorized_keys
fi

if [ -x /opt/mistio-collectd/collectd.sh ]; then
    /opt/mistio-collectd/collectd.sh start
fi

/usr/sbin/sshd -D
