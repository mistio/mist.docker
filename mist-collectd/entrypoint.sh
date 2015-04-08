#!/bin/bash

sed -i "s/USERNAME/$COLLECTD_USERNAME/g" /opt/mistio-collectd/uuid
sed -i "s/USERNAME/$COLLECTD_USERNAME/g" /opt/mistio-collectd/collectd.conf
sed -i "s/PASSWORD/$COLLECTD_PASSWORD/g" /opt/mistio-collectd/collectd.conf
