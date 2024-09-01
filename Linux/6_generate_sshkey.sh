#!/bin/bash

read -p "Masukkan direktori untuk menyimpan SSH Key: " key_directory

if [ ! -d "$key_directory" ]; then
    echo "Direktori $key_directory tidak ada. Membuat direktori..."
    mkdir -p "$key_directory"
    echo "Direktori $key_directory berhasil dibuat."
fi

key_file="$key_directory/id_rsa"

ssh-keygen -t rsa -b 4096 -f "$key_file" -N ""

