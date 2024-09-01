#!/bin/bash

WEBHOOK_URL="https://discord.com/api/webhooks/"

THRESHOLD=80

DISK_USAGE=$(df / --output=pcent | tail -n 1 | tr -d ' %')

if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    curl -H "Content-Type: application/json" \
         -X POST \
         -d "{\"content\": \"⚠️ Peringatan: Penggunaan disk mencapai ${DISK_USAGE}%.\"}" \
         $WEBHOOK_URL
fi
