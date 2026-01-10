#!/bin/bash

echo "=========================================="
echo "Laravel Docker Setup"
echo "=========================================="
echo ""

echo "1. Stopping any running containers..."
docker-compose down 2>/dev/null

echo "2. Removing old volumes..."
docker volume rm -f laravel-docker-simple_mysql_data 2>/dev/null || true

echo "3. Building and starting containers..."
docker-compose up -d --build

echo ""
echo "4. Checking container status..."
sleep 5
docker-compose ps

echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo " Access application at:"
echo "   http://localhost:8000"
echo ""
echo "View PHP info:"
echo "   http://localhost:8000/info.php"
echo ""

