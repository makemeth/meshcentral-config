# MeshCentral Configuration

This repository contains configuration and deployment scripts for MeshCentral server.

## Files

- `config.json`: MeshCentral server configuration
- `ecosystem.config.js`: PM2 process manager configuration
- `setup-meshcentral-pm2.sh`: Installation script for Ubuntu with PM2
- `manage-meshcentral.sh`: Management script for start/stop/restart/logs
- `meshcentral.service`: Systemd service configuration (alternative to PM2)

## Installation

### Using PM2 (Recommended)

1. Clone this repository:
```bash
git clone https://github.com/makemeth/meshcentral-config.git
cd meshcentral-config
```

2. Run the setup script:
```bash
chmod +x setup-meshcentral-pm2.sh
./setup-meshcentral-pm2.sh
```

3. Manage the service:
```bash
./manage-meshcentral.sh start   # Start server
./manage-meshcentral.sh status  # Check status
./manage-meshcentral.sh logs    # View logs
./manage-meshcentral.sh stop    # Stop server
```

### Using Systemd

1. Clone this repository
2. Copy meshcentral.service to systemd:
```bash
sudo cp meshcentral.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable meshcentral
sudo systemctl start meshcentral
```

## Configuration

The main configuration file is `config.json`. Key settings:

- Domain: camerahikvision.ddns.net
- HTTPS port: 443
- Features enabled:
  - WebRTC for better performance
  - Frame support for embedding
  - Automatic certificate management
