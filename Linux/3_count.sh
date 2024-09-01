#!/bin/bash

read -p "Masukkan direktori yang akan diproses: " directory
echo -e "Nama File\t\tBaris\tKata\tKarakter"

for file in "$directory"/*; do
    if [ -f "$file" ]; then
        lines=$(wc -l < "$file")
        words=$(wc -w < "$file")
        chars=$(wc -m < "$file")
        
        printf "%-20s\t%6d\t%6d\t%8d\n" "$(basename "$file")" "$lines" "$words" "$chars"
    fi
done
