#!/bin/bash

# Load environment variables from .env file
source .env

# Check if the variables are set
if [ -z "$REMOTE_SERVER_IP" ] || [ -z "$REMOTE_SERVER_USER" ] || [ -z "$REMOTE_SERVER_DIR" ]; then
  echo "One or more environment variables are missing. Make sure to set them in the .env file."
  exit 1
fi

# Transfer index.html
scp index.html ${REMOTE_SERVER_USER}@${REMOTE_SERVER_IP}:${REMOTE_SERVER_DIR}

# Transfer favicon
scp favicon.ico ${REMOTE_SERVER_USER}@${REMOTE_SERVER_IP}:${REMOTE_SERVER_DIR}

# Transfer css
scp style.css ${REMOTE_SERVER_USER}@${REMOTE_SERVER_IP}:${REMOTE_SERVER_DIR}

# Transfer img/ directory
scp -r img/ ${REMOTE_SERVER_USER}@${REMOTE_SERVER_IP}:${REMOTE_SERVER_DIR}

echo "Deployment complete."