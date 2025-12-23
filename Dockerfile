FROM n8nio/n8n:latest

USER root

# Install pdf-parse globally
RUN npm install -g pdf-parse

# Create the n8n custom extensions directory and install pdf-parse there
RUN mkdir -p /home/node/.n8n/custom-extensions/node_modules && \
    cd /home/node/.n8n/custom-extensions && \
    npm init -y && \
    npm install pdf-parse && \
    chown -R node:node /home/node/.n8n

# Switch back to node user
USER node

# Environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=Asia/Kolkata

# CRITICAL: Allow external modules AND disable sandbox restrictions
ENV NODE_FUNCTION_ALLOW_EXTERNAL=pdf-parse,pdf-lib,axios,buffer
ENV NODE_FUNCTION_ALLOW_BUILTIN=*
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false

# This is the key fix - disable the strict sandbox mode
ENV NODE_OPTIONS=--no-node-snapshot

EXPOSE 5678
