# Use Playwright image (includes all browser deps)
FROM mcr.microsoft.com/playwright:v1.44.0-jammy

# Switch to root to install packages
USER root

# Install Node.js 20
RUN apt-get update && apt-get install -y curl \
  && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
  && apt-get install -y nodejs

# Verify versions
RUN node -v && npm -v

# Install n8n globally
RUN npm install -g n8n

# Create n8n directory
RUN mkdir /data
WORKDIR /data

# Expose Railway port
EXPOSE 5678

# Start n8n
CMD ["n8n"]