#!/bin/bash

NETPLAN_CONFIG_FILE="/etc/netplan/01-netcfg.yaml"

sudo bash -c "cat > $NETPLAN_CONFIG_FILE" <<EOL
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: no
      addresses:
        - 192.168.1.100/24
      gateway4: 192.168.1.1
      nameservers:
        addresses:
          - 8.8.8.8
          - 8.8.4.4
EOL

sudo netplan apply

echo "Konfigurasi jaringan telah diterapkan untuk interface eth0."
