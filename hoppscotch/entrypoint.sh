#!/bin/sh

echo "Waiting for database..."

# Wait for the database to be ready
while ! nc -z <database_hostname> 5432; do
  sleep 1
done

echo "Database started"

# Run migrations
pnpm dlx prisma migrate deploy

echo "Migrations completed"

# Start the Hoppscotch application
exec "$@"
