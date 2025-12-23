nano # trigger ci cd

#!/bin/bash

ENV=${1:-staging}

echo "=== CI/CD PIPELINE START ($ENV) ==="

echo "📥 Pulling latest code..."
git pull origin main 2>/dev/null || echo "Local repo (no remote)"

echo "🛑 Stopping old container..."
./stop_nginx.sh $ENV

echo "🚀 Starting new container..."
./start_nginx.sh $ENV

echo "=== DEPLOYMENT DONE ($ENV) ==="
