#!/bin/sh

apt-get update
apt-get install -y vim net-tools

id devops
if [ "$?" -ne 0 ]; then
    useradd -m -d /home/devops -s /bin/bash devops
fi

# Configurando como IP_FORWARD
sysctl -w net.ipv4.ip_forward=1

# Configurando o firewall
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE 