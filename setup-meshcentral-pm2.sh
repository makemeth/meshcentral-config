#!/bin/bash

# Update system
sudo apt update
sudo apt install -y python3-venv python3-pip

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install nodejs-bin with cmd support
pip install nodejs-bin[cmd]

# Install PM2 globally through nodejs-bin
python -m nodejs.npm install -g pm2

# Create directory for MeshCentral
sudo mkdir -p /opt/meshcentral
cd /opt/meshcentral

# Install MeshCentral globally
python -m nodejs.npm install -g meshcentral

# Copy config file
cp ../config.json .

# Create PM2 startup script
python -m nodejs.pm2 startup

# Start MeshCentral with PM2
python -m nodejs.pm2 start "$(which python) -m nodejs venv/lib/python3*/site-packages/nodejs/node_modules/meshcentral/meshcentral.js --cert camerahikvision.ddns.net" --name meshcentral

# Save PM2 configuration
python -m nodejs.pm2 save

# Show status
python -m nodejs.pm2 status
