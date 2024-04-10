#!/bin/sh

set -e

if [ "$RAILS_ENV" = "development" ]; then
  echo "Sleeping 20 seconds to give PostgreSQL and redis time to boot up"
  sleep 20
fi

echo "sidekiq -C config/sidekiq.yml"
sidekiq -C config/sidekiq.yml
