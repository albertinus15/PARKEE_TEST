#!/bin/bash

HOSTNAME=$(hostname)

CURRENT_TIME=$(date +"%Y-%m-%d %H:%M:%S")

USER_COUNT=$(who | wc -l)

echo "Informasi Sistem Dasar:"
echo "------------------------"
echo "Nama Host       : $HOSTNAME"
echo "Waktu Saat Ini  : $CURRENT_TIME"
echo "Pengguna Login  : $USER_COUNT"
