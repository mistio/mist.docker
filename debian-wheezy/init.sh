#!/bin/bash

grep -qF -- "$PUBLIC_KEY" /root/.ssh/authorized_keys || echo "$PUBLIC_KEY" >> /root/.ssh/authorized_keys
if [ -x /opt/mistio-collectd/collectd.sh ]; then
    /opt/mistio-collectd/collectd.sh start
fi
/usr/sbin/sshd -D
