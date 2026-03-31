FROM n8nio/n8n:latest

USER root

# Install Alpine-compatible packages needed by n8n's PDF rendering nodes
RUN apk add --no-cache \
    nss \
    libx11 \
    libxrender \
    libxext \
    libxcomposite \
    libxdamage \
    libxrandr \
    libxscrnsaver \
    libc6-compat \
    ttf-freefont \
    fontconfig \
    chromium \
    python3 \
    jpeg-dev \
    pango \
    cairo \
    giflib \
    g++ \
    build-base

USER node

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=Asia/Kolkata

EXPOSE 5678