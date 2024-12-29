FROM ubuntu:latest

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.10 \
    python3-pip \
    git

# Install PyYAML
RUN pip3 install PyYAML

# Copy your Python script
COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh 

ENTRYPOINT ["/entrypoint.sh"]