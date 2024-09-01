#!/bin/bash

read -p "Masukkan file public key: " public_key_file
read -p "Masukkan username di server: " username
read -p "Masukkan IP address server: " server_ip

ssh "$username@$server_ip" "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" < "$public_key_file"

