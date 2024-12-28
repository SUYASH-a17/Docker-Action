FROM ubuntu:latest

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    python3-distutils \
    git \
    build-essential \
    libffi-dev \
    libssl-dev \
    libpython3-dev \
    software-properties-common && \
    apt-get clean

# Upgrade pip to the latest version
RUN pip3 install --upgrade pip

# Install PyYAML
RUN pip3 install --no-cache-dir PyYAML

# Copy your Python script
COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh 

ENTRYPOINT ["/entrypoint.sh"]