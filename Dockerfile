# Dockerfile
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    python3 \
    fortune-mod \
    cowsay \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Working directory
WORKDIR /app

# Copy application files
COPY wisecow.sh /app/wisecow.sh
COPY web_wrapper.py /app/web_wrapper.py

RUN chmod +x /app/wisecow.sh /app/web_wrapper.py

# Expose HTTP port
EXPOSE 5000

CMD ["python3", "/app/web_wrapper.py"]
