#!/bin/sh

echo "Running migrations..."
python manage.py migrate

echo "Starting Django app..."
exec gunicorn myapp.wsgi:application --bind 0.0.0.0:8000
