#!/bin/bash
set -e
echo "Installing dependencies..."
# Stop the current backend service if running
pm2 stop "test-trk" || true

# Navigate to the app directory
cd /home/ec2-user/cicd
sudo npm install

# Start the backend service with PM2
pm2 start dist/main.js --name "test-trk" || pm2 restart "test-trk"
