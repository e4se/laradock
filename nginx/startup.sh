#!/bin/bash

if [ ! -f /etc/nginx/ssl/report3.test.crt ]; then
    openssl genrsa -out "/etc/nginx/ssl/report3.test.key" 2048
    openssl req -new -key "/etc/nginx/ssl/report3.test.key" -out "/etc/nginx/ssl/report3.test.csr" -subj "/CN=report3.test/O=REPORT/C=UK"
    openssl x509 -req -days 365 -in "/etc/nginx/ssl/report3.test.csr" -signkey "/etc/nginx/ssl/report3.test.key" -out "/etc/nginx/ssl/report3.test.crt"
fi

if [ ! -f /etc/nginx/ssl/deeplink.local.crt ]; then
    openssl genrsa -out "/etc/nginx/ssl/deeplink.local.key" 2048
    openssl req -new -key "/etc/nginx/ssl/deeplink.local.key" -out "/etc/nginx/ssl/deeplink.local.csr" -subj "/CN=deeplink.local/O=DEEPLINK/C=UK"
    openssl x509 -req -days 365 -in "/etc/nginx/ssl/deeplink.local.csr" -signkey "/etc/nginx/ssl/deeplink.local.key" -out "/etc/nginx/ssl/deeplink.local.crt"
fi

if [ ! -f /etc/nginx/ssl/gregory.bot.crt ]; then
    openssl genrsa -out "/etc/nginx/ssl/gregory.bot.key" 2048
    openssl req -new -key "/etc/nginx/ssl/gregory.bot.key" -out "/etc/nginx/ssl/gregory.bot.csr" -subj "/CN=gregory.bot/O=GREGORYBOT/C=UK"
    openssl x509 -req -days 365 -in "/etc/nginx/ssl/gregory.bot.csr" -signkey "/etc/nginx/ssl/gregory.bot.key" -out "/etc/nginx/ssl/gregory.bot.crt"
fi

# Start crond in background
crond -l 2 -b

# Start nginx in foreground
nginx
