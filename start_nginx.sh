#!/bin/bash

# ===== VALIDASI ARGUMEN =====
if [ -z "$1" ]; then
  echo "Usage: ./start_nginx.sh staging|prod"
  exit 1
fi

ENV=$1
CONTAINER_NAME=nginx_$ENV

# Tentukan folder berdasarkan environment
if [ "$ENV" = "staging" ]; then
  APP_DIR="$(pwd)/app-staging"
  PORT=8082
elif [ "$ENV" = "prod" ]; then
  APP_DIR="$(pwd)/app-prod"
  PORT=8083
else
  echo "Environment tidak dikenal: $ENV"
  exit 1
fi

# ===== STOP & REMOVE CONTAINER LAMA =====
podman stop $CONTAINER_NAME 2>/dev/null
podman rm $CONTAINER_NAME 2>/dev/null

# ===== JALANKAN CONTAINER BARU =====
podman run -d \
  --name $CONTAINER_NAME \
  -p $PORT:80 \
  -v $APP_DIR:/usr/share/nginx/html:ro \
  nginx

echo "Container $CONTAINER_NAME running at http://localhost:$PORT"

