#!/bin/bash
set -e

# Stop the current backend service if running
pm2 stop backend || true

# Navigate to the app directory
cd /home/ec2-user/cicd

# Install production dependencies
npm install

# Start the backend service with PM2
pm2 start dist/main.js --name "backend" || pm2 restart "backend"
