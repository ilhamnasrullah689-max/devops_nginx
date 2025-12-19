#!/bin/bash
echo "=== CI/CD PIPELINE START ==="

echo "Pulling latest code..."
git pull origin main 2>/dev/null || echo "Local repo"

echo "Stopping old container..."
./stop_nginx.sh

echo "Starting new container..."
./start_nginx.sh

echo "=== DEPLOYMENT DONE ==="

