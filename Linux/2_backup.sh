#!/bin/bash

read -p "Masukkan direktori sumber yang akan di-backup: " source_directory
read -p "Masukkan lokasi penyimpanan hasil backup: " backup_location

timestamp=$(date +"%Y%m%d_%H%M%S")

backup_filename="$(basename "$source_directory")_${timestamp}_backup.tar.gz"

tar -czf "$backup_location/$backup_filename" -C "$source_directory" .

echo "Backup berhasil disimpan sebagai $backup_location/$backup_filename"
