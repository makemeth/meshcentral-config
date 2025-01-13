#!/bin/bash

# Update system
sudo apt update
sudo apt install -y nodejs npm

# Install MeshCentral globally
sudo npm install -g meshcentral

# Create directory for MeshCentral
sudo mkdir -p /opt/meshcentral
cd /opt/meshcentral

# Create user and group
sudo useradd -r -s /bin/false meshcentral
sudo chown -R meshcentral:meshcentral /opt/meshcentral

# Copy service file
sudo cp meshcentral.service /etc/systemd/system/

# Open firewall ports
sudo ufw allow 443/tcp
sudo ufw allow 80/tcp

# Reload systemd
sudo systemctl daemon-reload

# Enable and start service
sudo systemctl enable meshcentral
sudo systemctl start meshcentral

# Show status
sudo systemctl status meshcentral
