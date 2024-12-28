FROM ubuntu:latest

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-distutils \
    python3-venv \
    git

# Upgrade pip to the latest version
RUN pip3 install --upgrade pip

# Install Python packages
RUN pip3 install PyYAML

# Copy your Python script
COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh 

ENTRYPOINT ["/entrypoint.sh"]