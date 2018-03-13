#!/bin/bash
set -e

export PGPASSWORD=$DB_PASSWORD
until psql -h "${DB_HOST}" -U "${DB_USERNAME}" -l
do
  echo "We are waiting for postgresql, please wait."
  sleep 1
done

RAILS_ENV=production bin/rake db:create
RAILS_ENV=production bin/rake db:migrate

if [ -z "$1" ]; then
  exec bash
else
  exec "$@"
fi
