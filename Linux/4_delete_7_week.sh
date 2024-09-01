#!/bin/bash

read -p "Masukkan direktori sumber yang akan di-backup: " source_directory
read -p "Masukkan direktori tujuan untuk menyimpan hasil backup: " backup_directory

timestamp=$(date +"%Y%m%d_%H%M%S")

backup_filename="$(basename "$source_directory")_${timestamp}_backup.tar.gz"

tar -czf "$backup_directory/$backup_filename" -C "$source_directory" .

echo "Backup berhasil disimpan sebagai $backup_directory/$backup_filename"

find "$backup_directory" -name "$(basename "$source_directory")_*.tar.gz" -type f -mtime +7 -exec rm {} \;

echo "Backup yang lebih lama dari 7 hari telah dihapus dari $backup_directory"
