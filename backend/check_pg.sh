#!/bin/bash
set -e
sudo -u postgres psql -Atc "SELECT version();"
echo "---"
sudo -u postgres psql -Atc "SELECT datname FROM pg_database WHERE datname='studentdb';"
echo "---"
sudo -u postgres psql -Atc "SELECT rolname FROM pg_roles WHERE rolname='postgres';"
echo "---"
# Set postgres password and create the studentdb database if missing
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'password';"
sudo -u postgres psql -c "CREATE DATABASE studentdb;" 2>/dev/null || true
sudo cp /home/manji/Enxcl-Infra-Student-Management-Deploy/db/init.sql /tmp/init.sql
sudo -u postgres psql -d studentdb -f /tmp/init.sql

echo "Done: postgres password set to 'password', studentdb created/initialized."
