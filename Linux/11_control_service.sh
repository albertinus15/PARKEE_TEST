#!/bin/bash

read -p "Masukkan tindakan (start/stop/status): " ACTION
read -p "Masukkan nama service: " SERVICE

case $ACTION in
    start)
        sudo systemctl start $SERVICE && echo "Service $SERVICE berhasil dimulai."
        ;;
    stop)
        sudo systemctl stop $SERVICE && echo "Service $SERVICE berhasil dihentikan."
        ;;
    status)
        sudo systemctl status $SERVICE
        ;;
    *)
        echo "Aksi tidak dikenali: $ACTION"
        ;;
esac
