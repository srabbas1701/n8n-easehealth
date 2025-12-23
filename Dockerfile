FROM n8nio/n8n:latest

USER root

# Install pdf-parse in a way that works with n8n's module resolution
RUN cd /usr/local/lib/node_modules/n8n && \
    npm install --save pdf-parse || true

# Create node_modules in n8n if it doesn't exist and install there too
RUN mkdir -p /usr/local/lib/node_modules/n8n/node_modules && \
    cd /usr/local/lib/node_modules/n8n/node_modules && \
    npm init -y 2>/dev/null || true && \
    npm install pdf-parse 2>/dev/null || true

# Fallback: Install globally and create symlink
RUN npm install -g pdf-parse && \
    ln -sf /usr/local/lib/node_modules/pdf-parse /usr/local/lib/node_modules/n8n/node_modules/pdf-parse 2>/dev/null || true

# Switch back to node user
USER node

# Environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=Asia/Kolkata

# CRITICAL: Allow external modules in n8n Code nodes
ENV NODE_FUNCTION_ALLOW_EXTERNAL=pdf-parse,pdf-lib,axios,buffer
ENV NODE_FUNCTION_ALLOW_BUILTIN=*

EXPOSE 5678
