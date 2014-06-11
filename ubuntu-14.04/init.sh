#!/bin/bash

echo $PUBLIC_KEY >> /root/.ssh/authorized_keys
/usr/sbin/sshd -D