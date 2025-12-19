#!/bin/bash
# Stop & remove container otomatis
CONTAINER_NAME=nginx_auto

podman stop $CONTAINER_NAME 2>/dev/null
podman rm $CONTAINER_NAME 2>/dev/null

echo "Container $CONTAINER_NAME stopped and removed"

