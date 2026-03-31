FROM n8nio/n8n:latest

USER root

# Install packages needed for PDF rendering (Debian version)
RUN apt-get update && apt-get install -y \
  ca-certificates \
  libnss3 \
  libxss1 \
  libx11-dev \
  x11-utils \
  libsecret-1-dev \
  libgtk-3-0 \
  libasound2 \
  libxshmfence-dev \
  libcairo2-dev \
  libjpeg-dev \
  libpango1.0-dev \
  giflib-tools \
  build-essential \
  g++ \
  python3 \
  && rm -rf /var/lib/apt/lists/*

USER node

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=Asia/Kolkata
ENV NODE_OPTIONS=--no-node-snapshot