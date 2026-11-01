#!/bin/bash
set -e

sudo mkdir -p /opt/rikkei/pg-data

# Khoi chay container voi volume mount
docker run -d \
  --name rikkei-db \
  -e POSTGRES_PASSWORD="Rikkei@2026" \
  -v /opt/rikkei/pg-data:/var/lib/postgresql/data \
  postgres:13

echo "Cho 5 giay de khoi tao du lieu PostgreSQL..."
sleep 5

# Cuong che xoa container
docker rm -f rikkei-db

# Khoi chay lai container moi voi cung volume
docker run -d \
  --name rikkei-db \
  -e POSTGRES_PASSWORD="Rikkei@2026" \
  -v /opt/rikkei/pg-data:/var/lib/postgresql/data \
  postgres:13

# Kiem tra file ben vung tren host
ls -l /opt/rikkei/pg-data
