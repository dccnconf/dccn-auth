#!/bin/sh
echo "Waiting for postgres at $DB_HOST:$DB_PORT..."

while ! nc -z "$DB_HOST" "$DB_PORT"; do
  sleep 1.0
  echo "... pending"
done

echo "PostgreSQL started"

# python manage.py create_db

/usr/local/bin/uwsgi \
  --module "app:create_app()" \
  --http :3000 \
  --stats :9191 \
  --enable-threads \
  --master \
  --processes "${UWSGI_PROCESSES:-2}" \
  --threads "${UWSGI_THREADS:-4}" \
  --harakiri "${UWSGI_HARAKIRI:-10}"
