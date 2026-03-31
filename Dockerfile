
FROM n8nio/n8n:latest

USER root

# 🛠 Install system libraries required by pdfjs-dist for Extract From PDF
RUN apt-get update && apt-get install -y \
    libnss3 \
    libxss1 \
    libx11-dev \
    libxkbfile-dev \
    libsecret-1-dev \
    libgtk-3-0 \
    libasound2 \
    libxshmfence-dev \
    libcairo2 \
    libjpeg-dev \
    libpango1.0-0 \
    libgif-dev \
    build-essential \
    g++ \
    python3 \
 && apt-get clean

# Optional: remove deprecated RUNNERS env variable if still in use
ENV N8N_RUNNERS_ENABLED=

# Switch back to node user
USER node

# 🌐 Core Environment Variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV GENERIC_TIMEZONE=Asia/Kolkata

# 📤 Unblock access for advanced JS use in Function nodes (optional)
ENV NODE_FUNCTION_ALLOW_BUILTIN=*
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false
ENV NODE_OPTIONS=--no-node-snapshot

EXPOSE 5678