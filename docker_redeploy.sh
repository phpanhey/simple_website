#!/bin/bash

# Pull the latest changes from GitHub
git pull origin main

# Build the new Docker image
docker build -t philipp-panhey-de .

# Stop the currently running container
docker stop philipp-panhey-de || true

# Remove the stopped container
docker rm philipp-panhey-de || true

# Run the new Docker container
docker run -d --restart always --name philipp-panhey-de -p 80:80 -p 443:443 -v $(pwd)/../EventParser/events.json:/usr/share/nginx/html/events.json philipp-panhey-de
