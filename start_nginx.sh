#!/bin/bash
# Script untuk start nginx container otomatis
CONTAINER_NAME=nginx_auto
PORT=8082

# Stop & remove jika container sebelumnya ada
podman stop $CONTAINER_NAME 2>/dev/null
podman rm $CONTAINER_NAME 2>/dev/null

# Jalankan container baru
podman run -d --name $CONTAINER_NAME -p $PORT:80 nginx

echo "Container $CONTAINER_NAME running at http://localhost:$PORT"

