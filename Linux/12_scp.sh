#!/bin/bash

read -p "Masukkan path file source: " FILE_SOURCE
read -p "Masukkan username: " USERNAME
read -p "Masukkan IP address server tujuan: " IP_ADDRESS

if scp "$FILE_SOURCE" "${USERNAME}@${IP_ADDRESS}:~"; then
    echo "File $FILE_SOURCE berhasil disalin ke ${USERNAME}@${IP_ADDRESS}:~"
else
    echo "Gagal menyalin file $FILE_SOURCE ke ${USERNAME}@${IP_ADDRESS}:~"
fi
