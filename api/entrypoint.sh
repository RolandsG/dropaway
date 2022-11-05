#!/bin/sh

startserver()
{
    python /app/manage.py runserver 0.0.0.0:8000
}

for cmd in $@
do
   $cmd
done
