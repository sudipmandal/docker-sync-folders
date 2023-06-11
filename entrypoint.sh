#!/bin/bash

# Get the current user name
current_user=$(whoami)
echo "Current user: $current_user"

# Read the value of the environment variables
rsync_options="$RSYNC_OPTIONS"
sync_frequency="$SYNC_FREQUENCY"

# Display the values
echo "RSYNC_OPTIONS: $rsync_options"
echo "SYNC_FREQUENCY: $sync_frequency"

# Validate SYNC_FREQUENCY as a whole number
if ! [[ "$sync_frequency" =~ ^[0-9]+$ ]]; then
  echo "Error: SYNC_FREQUENCY should be a whole number."
  exit 1
fi

# Call rsync with rsync_options as a parameter
while true; do
  echo "Starting Sync.."
  rsync $rsync_options /source/ /destination
  echo "Sync Complete"
  
  # Sleep for sync_frequency seconds before running rsync again
  sleep "$sync_frequency"
done
