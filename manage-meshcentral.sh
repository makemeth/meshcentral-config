#!/bin/bash

# Activate virtual environment
source venv/bin/activate

case "$1" in
    start)
        echo "Starting MeshCentral..."
        python -m nodejs.pm2 start ecosystem.config.js
        ;;
    stop)
        echo "Stopping MeshCentral..."
        python -m nodejs.pm2 stop meshcentral
        ;;
    restart)
        echo "Restarting MeshCentral..."
        python -m nodejs.pm2 restart meshcentral
        ;;
    status)
        echo "MeshCentral Status:"
        python -m nodejs.pm2 status
        ;;
    logs)
        echo "MeshCentral Logs:"
        python -m nodejs.pm2 logs meshcentral
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status|logs}"
        exit 1
        ;;
esac

exit 0
