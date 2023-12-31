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
# Rsync options to set for operation, by default performs dry run only
ENV RSYNC_OPTIONS="-rnv"

# Frequency in seconds when rsync will be run on the folders
ENV SYNC_FREQUENCY="300"

# Run as root user to prevent file access issues
USER root

# Set the script as the entry point
ENTRYPOINT ["/entrypoint.sh"]
