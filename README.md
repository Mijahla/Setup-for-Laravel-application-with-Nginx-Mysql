
# Setup-for-Laravel-application-with-Nginx-Mysql

Laravel with nginx mysql 
### Prerequisites
- Docker installed
- Docker Compose installed
- Git installed

### One-Command Setup
```bash
# Clone the repository
git clone https://github.com/Mijahla/Setup-for-Laravel-application-with-Nginx-Mysql.git
cd Setup-for-Laravel-application-with-Nginx-Mysql

# Make setup script executable
chmod +x setup.sh

# Run setup (installs Laravel, builds containers, starts services)
./setup.sh

# Run the containers 
docker compose up -d

# Access the application
http://localhost:8000
