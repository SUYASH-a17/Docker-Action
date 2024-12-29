FROM ubuntu:latest

# Set environment variable to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.10 \
    python3-pip \
    git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PyYAML
RUN pip3 install --no-cache-dir PyYAML

# Copy Python script
COPY feed.py /usr/bin/feed.py

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint.sh executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
