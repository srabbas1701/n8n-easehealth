FROM n8nio/n8n:latest

USER root

# Install pdf-parse globally
RUN npm install -g pdf-parse

# Create symlink inside n8n node_modules to global pdf-parse
RUN mkdir -p /usr/local/lib/node_modules/n8n/node_modules && \
    ln -s /usr/local/lib/node_modules/pdf-parse /usr/local/lib/node_modules/n8n/node_modules/pdf-parse

# Create entrypoint script that fixes permissions at runtime
RUN echo '#!/bin/sh' > /docker-entrypoint.sh && \
    echo 'mkdir -p /home/node/.n8n' >> /docker-entrypoint.sh && \
    echo 'chown -R node:node /home/node/.n8n' >> /docker-entrypoint.sh && \
    echo 'chmod -R 755 /home/node/.n8n' >> /docker-entrypoint.sh && \
    echo 'exec su-exec node n8n start' >> /docker-entrypoint.sh && \
    chmod +x /docker-entrypoint.sh

# Environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=Asia/Kolkata
ENV N8N_USER_FOLDER=/home/node/.n8n

# CRITICAL: Allow external modules in n8n Code nodes
ENV NODE_FUNCTION_ALLOW_EXTERNAL=pdf-parse,pdf-lib,axios
ENV NODE_FUNCTION_ALLOW_BUILTIN=*
ENV NODE_PATH=/usr/local/lib/node_modules

EXPOSE 5678

# Run as root initially, entrypoint will switch to node user
ENTRYPOINT ["/docker-entrypoint.sh"]
