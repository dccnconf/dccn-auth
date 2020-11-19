FROM python:3.6-alpine

RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev libffi-dev

# Assume that code was already mounted to /app, so no need to
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 3000
ENTRYPOINT [ "/bin/sh" ]
