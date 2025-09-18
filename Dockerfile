# Dockerfile
FROM ubuntu:22.04

# noninteractive apt
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bash \
      curl \
      socat \
      fortune-mod \
      cowsay && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the app
WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

# Expose the port used by wisecow (README says default 4499)
EXPOSE 4499

# Run
CMD [ "/app/wisecow.sh" ]
