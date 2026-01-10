#!/bin/bash

echo "Installing Laravel..."

# Create src directory if it doesn't exist
mkdir -p src

# Check if Laravel is already installed
if [ ! -f "src/composer.json" ]; then
    echo "Downloading Laravel..."
    
    # Create temporary directory
    mkdir -p temp-app
    cd temp-app
    
    # Create composer.json for Laravel
    cat > composer.json << 'COMPOSER'
{
    "require": {
        "laravel/laravel": "^10.0"
    }
}
COMPOSER
    
    # Install Laravel using Docker
    docker run --rm \
        -v $(pwd):/app \
        composer require laravel/laravel
    
    # Move Laravel files to src directory
    mv vendor/laravel/laravel/* ../../src/ 2>/dev/null || true
    
    # Clean up
    cd ..
    rm -rf temp-app
    
    echo "Laravel downloaded successfully!"
else
    echo "Laravel already exists in src directory."
fi

# Create .env file if it doesn't exist
if [ ! -f "src/.env" ]; then
    echo "Creating .env file..."
    cp src/.env.example src/.env
    
    # Update database configuration
    sed -i 's/DB_HOST=127.0.0.1/DB_HOST=mysql/' src/.env
    sed -i 's/DB_DATABASE=laravel/DB_DATABASE=laravel_db/' src/.env
    sed -i 's/DB_USERNAME=root/DB_USERNAME=laravel_user/' src/.env
    sed -i 's/DB_PASSWORD=/DB_PASSWORD=secret/' src/.env
fi

# Set permissions
echo "Setting permissions..."
chmod -R 775 src/storage src/bootstrap/cache 2>/dev/null || true

echo ""
echo "=== Installation Complete ==="
echo "Run: docker-compose up -d"
echo "Visit: http://localhost"
