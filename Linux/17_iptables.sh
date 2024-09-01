#!/bin/bash

iptables -F
iptables -X

iptables -P OUTPUT ACCEPT

iptables -A INPUT -p tcp --dport 22 -j ACCEPT

iptables -A INPUT -p tcp --dport 80 -j ACCEPT

iptables -A INPUT -p tcp --dport 443 -j ACCEPT

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -P INPUT DROP

iptables -P FORWARD DROP

echo "Aturan iptables yang dikonfigurasi:"
iptables -L -v
