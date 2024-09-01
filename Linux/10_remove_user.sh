#!/bin/bash

read -p "Masukkan string unik dari public key: " unique_string
read -p "Masukkan username: " username

user_home=$(eval echo "~$username")

auth_keys_file="$user_home/.ssh/authorized_keys"

grep -v "$unique_string" "$auth_keys_file" > "$auth_keys_file.tmp" && mv "$auth_keys_file.tmp" "$auth_keys_file"

echo "Public key yang mengandung '$unique_string' berhasil dihapus dari $auth_keys_file"
