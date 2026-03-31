FROM n8nio/n8n:latest

USER root

# ✅ Install Alpine-compatible packages needed by Extract PDF node
RUN apk add --no-cache \
    nss \
    xss \
    libx11-dev \
    xkeyboard-config \
    libsecret \
    gtk+3.0 \
    alsa-lib \
    libxshmfence \
    cairo \
    jpeg-dev \
    pango \
    giflib \
    build-base \
    g++ \
    python3

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