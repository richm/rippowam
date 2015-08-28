#!/bin/sh
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -I FORWARD 1 -j ACCEPT
iptables-save > /etc/sysconfig/iptables
