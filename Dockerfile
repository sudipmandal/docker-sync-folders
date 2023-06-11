FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    rsync \
    bash

# Create directories
RUN mkdir /source && \
    mkdir /destination

# Declare directories as volumes
VOLUME /source
VOLUME /destination

# Copy the script to the / folder
COPY entrypoint.sh /

# Make the script executable
RUN chmod +x /entrypoint.sh

# Set environment variables
# Rsync options to set for operation
ENV RSYNC_OPTIONS=""

# Frequency in seconds when rsync will be run on the folders
ENV SYNC_FREQUENCY="300"

# Set the script as the entry point
ENTRYPOINT ["/entrypoint.sh"]
