#!/bin/sh

apt-get update
apt-get install -y vim net-tools

id devops
if [ "$?" -ne 0 ]; then
    useradd -m -d /home/devops -s /bin/bash devops
fi

# Matando interface eth0
echo " " > /etc/network/interfaces.d/eth0.cfg

# Removendo Gateway pelo eth0
route del default

# Adicionando a máquina security como Gateway
route add default gw 10.8.0.1 eth1