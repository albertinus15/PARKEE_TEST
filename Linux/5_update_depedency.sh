#!/bin/bash

log_file="/var/log/system_update.log"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$log_file"
}

if [ -x "$(command -v apt)" ]; then
    package_manager="apt"
elif [ -x "$(command -v yum)" ]; then
    package_manager="yum"
elif [ -x "$(command -v dnf)" ]; then
    package_manager="dnf"
elif [ -x "$(command -v pacman)" ]; then
    package_manager="pacman"
else
    log "Package manager tidak ditemukan. Update tidak dapat dilanjutkan."
    exit 1
fi

log "Memulai update sistem menggunakan $package_manager..."

case $package_manager in
    apt)
        sudo apt update | tee -a "$log_file"
        sudo apt upgrade -y | tee -a "$log_file"
        ;;
    yum)
        sudo yum update -y | tee -a "$log_file"
        ;;
    dnf)
        sudo dnf update -y | tee -a "$log_file"
        ;;
    pacman)
        sudo pacman -Syu --noconfirm | tee -a "$log_file"
        ;;
    *)
        log "Package manager tidak dikenali."
        exit 1
        ;;
esac

log "Update sistem selesai."

