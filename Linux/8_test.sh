#!/bin/bash

read -p "Masukkan username di server: " username
read -p "Masukkan IP server: " server_ip

if ssh -o BatchMode=yes -o ConnectTimeout=5 "$username@$server_ip" "exit" &>/dev/null; then
    echo "Koneksi ke $username@$server_ip berhasil."
else
    echo "Koneksi ke $username@$server_ip gagal."
fi
