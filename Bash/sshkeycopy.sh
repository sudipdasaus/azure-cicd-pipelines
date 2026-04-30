#!/bin/bash

# Define the SSH key file you want to copy
SSH_KEY_FILE="/home/sudip/.ssh/id_rsa.pub"

# Define the list of remote hosts
REMOTE_HOSTS=("10.210.1.30")

# Define the username for SSH access
SSH_USERNAME="sudip"

# Loop through the list of remote hosts
for host in "${REMOTE_HOSTS[@]}"; do
  # Use ssh-copy-id to copy the SSH key to the remote host
  ssh-copy-id -i "$SSH_KEY_FILE" "$SSH_USERNAME@$host"

  # Check the exit status of ssh-copy-id
  if [ $? -eq 0 ]; then
    echo "SSH key copied successfully to $host"
  else
    echo "Failed to copy SSH key to $host"
  fi
done
