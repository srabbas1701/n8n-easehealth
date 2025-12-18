# Navigate to your n8n directory
cd C:\n8n

# Update the Dockerfile with the correct content
@"
FROM n8nio/n8n:latest

USER root

# Install pdf-parse globally
RUN npm install -g pdf-parse

# Create symlink inside n8n node_modules to global pdf-parse
RUN mkdir -p /usr/local/lib/node_modules/n8n/node_modules && \
    ln -s /usr/local/lib/node_modules/pdf-parse /usr/local/lib/node_modules/n8n/node_modules/pdf-parse

USER node

# Environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=Asia/Kolkata

EXPOSE 5678
"@ | Out-File -FilePath Dockerfile -Encoding utf8

Write-Host "✅ Dockerfile updated with pdf-parse installation"
