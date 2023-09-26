#!/bin/bash

# Cd into Sites Directory
cd ~/sites/

# Clone Repo
git clone https://github.com/jurdunnn/portfolio 

# Copy populated .env into repo
cp ~/sites/.portfolio-env ~/sites/portfolio/.env

# Cd into repo
cd ~/sites/portfolio/

# Composer Install
composer install

# npm Install
npm install

# Generate Encryption key
php artisan key:generate

# Migrate any new tables
php artisan migrate

# Run build
npm run build

# Cd into www
cd /var/www

# Remove old Site From /var/www
sudo rm -rf portfolio

# Move repo to /var/www
sudo mv ~/sites/portfolio ./

# Set Ownership
sudo chown -R www-data:www-data portfolio 

# Set permissions
sudo chmod -R 775 portfolio
