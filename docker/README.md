# Kiro Docker Container

Run Kiro CLI in an isolated Docker container - safely sandboxed from your host system.

See main [README.md](../README.md) for usage commands.

## Setup

```bash
cd docker
chmod +x run-kiro.sh
docker compose build
```

## Authentication

**AWS Builder ID (Recommended):**
```bash
./run-kiro.sh .. login
# Follow the URL and enter the code in your browser
```

**Social Login (Google/GitHub):**
Container exposes ports 49152-49160 for OAuth callbacks - should work automatically.
