FROM n8nio/n8n:latest

USER root

# Install Debian-compatible libraries for PDF/image rendering
RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    libgbm-dev \
    libxshmfence-dev \
    libxss1 \
    libgtk-3-0 \
    libpango-1.0-0 \
    libcairo2 \
    libjpeg62-turbo \
    && apt-get clean

USER node

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV GENERIC_TIMEZONE=Asia/Kolkata

EXPOSE 5678