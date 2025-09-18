# Use a lightweight Python 3 base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bash \
        fortune-mod \
        cowsay \
        curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy application files
COPY wisecow/wisecow.sh /app/wisecow.sh
COPY wisecow/web_wrapper.py /app/web_wrapper.py

# Make scripts executable
RUN chmod +x /app/wisecow.sh /app/web_wrapper.py

# Expose the port your app listens on
EXPOSE 5000

# Run the wrapper script by default
CMD ["python3", "/app/web_wrapper.py"]
