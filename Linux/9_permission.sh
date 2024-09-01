#!/bin/bash

read -p "Masukkan path ke file public key: " public_key_file
read -p "Masukkan username: " username

user_home=$(eval echo "~$username")

mkdir -p "$user_home/.ssh"

cat "$public_key_file" >> "$user_home/.ssh/authorized_keys"

chown "$username:$username" "$user_home/.ssh/authorized_keys"
chmod 600 "$user_home/.ssh/authorized_keys"

echo "Public key berhasil ditambahkan ke $user_home/.ssh/authorized_keys"
