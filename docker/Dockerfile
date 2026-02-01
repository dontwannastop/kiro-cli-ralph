FROM node:20-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    jq \
    unzip \
    # For headless Chrome
    chromium \
    fonts-liberation \
    libnss3 \
    libxss1 \
    libasound2 \
    && rm -rf /var/lib/apt/lists/* \
    # Create symlinks for chrome-devtools-mcp to find chromium
    && ln -sf /usr/bin/chromium /usr/bin/google-chrome \
    && ln -sf /usr/bin/chromium /usr/bin/google-chrome-stable

# Install Kiro CLI
RUN curl -fsSL https://cli.kiro.dev/install | bash

# Add kiro to PATH
ENV PATH="/root/.local/bin:$PATH"
# Set Chromium path
ENV CHROME_PATH=/usr/bin/chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV CHROME_EXECUTABLE_PATH=/usr/bin/chromium

# Create workspace directory
WORKDIR /workspace

# Expose port range for OAuth callback (social login)
EXPOSE 49152-49200

ENTRYPOINT ["kiro-cli"]
