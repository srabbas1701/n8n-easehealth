FROM n8nio/n8n:latest

USER root

# Install pdf-parse directly into n8n's node_modules (not globally)
# This ensures it's accessible from n8n Code nodes
WORKDIR /usr/local/lib/node_modules/n8n
RUN npm install pdf-parse --save

# Also install globally as backup
RUN npm install -g pdf-parse

# Reset working directory
WORKDIR /home/node

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
