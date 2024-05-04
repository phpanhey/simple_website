#!/bin/bash

# Load environment variables from .env file
source .env

# Check if the variables are set
if [ -z "$REMOTE_SERVER_IP" ] || [ -z "$REMOTE_SERVER_USER" ] || [ -z "$REMOTE_SERVER_DIR" ]; then
  echo "One or more environment variables are missing. Make sure to set them in the .env file."
  exit 1
fi

ssh ${REMOTE_SERVER_USER}@${REMOTE_SERVER_IP} "cd ${REMOTE_SERVER_DIR}; sh docker_redeploy.sh"

echo "Deployment complete."