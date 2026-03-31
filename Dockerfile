FROM n8nio/n8n:latest

USER root

# Install necessary Alpine packages
RUN apk update && \
    apk add --no-cache \
    libc6-compat \
    libstdc++ \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    && rm -rf /var/cache/apk/*

USER node

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV GENERIC_TIMEZONE=Asia/Kolkata

EXPOSE 5678