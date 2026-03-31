FROM n8nio/n8n:latest

USER root

# Install dependencies using Debian-compatible commands
RUN apt-get update && \
    apt-get install -y \
        chromium \
        libnss3 \
        libatk-bridge2.0-0 \
        libxss1 \
        libasound2 \
        libgtk-3-0 \
        fonts-freefont-ttf \
        --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER node

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV GENERIC_TIMEZONE=Asia/Kolkata

EXPOSE 5678