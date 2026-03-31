FROM node:20-bookworm

# Install system dependencies
RUN apt-get update && apt-get install -y \
  chromium \
  fonts-liberation \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libcups2 \
  libdbus-1-3 \
  libgdk-pixbuf2.0-0 \
  libnspr4 \
  libnss3 \
  libxcomposite1 \
  libxdamage1 \
  libxrandr2 \
  xdg-utils \
  wget \
  unzip \
  curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install n8n
RUN npm install --location=global n8n

# Create n8n user
RUN useradd -m -s /bin/bash node
USER node

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV GENERIC_TIMEZONE=Asia/Kolkata

EXPOSE 5678

CMD ["n8n"]