#!/usr/bin/env bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /rails/tmp/pids/server.pid

# Check if the database exists, if not create it and migrate
echo "Checking database status..."
bin/rails db:prepare

# Then exec the container's main process (specified as CMD in the Dockerfile).
exec "$@"
