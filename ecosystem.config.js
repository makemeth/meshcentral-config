module.exports = {
  apps : [{
    name: 'meshcentral',
    script: 'python',
    args: ['-m', 'nodejs', 'venv/lib/python3*/site-packages/nodejs/node_modules/meshcentral/meshcentral.js', '--cert', 'camerahikvision.ddns.net'],
    instances: 1,
    autorestart: true,
    watch: false,
    max_memory_restart: '1G',
    env: {
      NODE_ENV: 'production'
    }
  }]
};
