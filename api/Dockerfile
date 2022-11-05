FROM python:3.11-alpine
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /app

RUN pip install -U pip
RUN pip install psycopg2-binary
COPY api/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

COPY ./api/* /app