#!/bin/sh

apt-get update
apt-get install -y vim net-tools

id devops
if [ "$?" -ne 0 ]; then
    useradd -m -d /home/devops -s /bin/bash devops
fi
