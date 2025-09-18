# Use Minikube base image (preloaded, avoids internet fetch)
FROM gcr.io/k8s-minikube/kicbase:v0.0.47

WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bash \
        python3 \
        python3-pip \
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

EXPOSE 5000

CMD ["python3", "/app/web_wrapper.py"]
