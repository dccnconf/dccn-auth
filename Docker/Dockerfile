FROM python:3.9-alpine

RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev libffi-dev

# Create a user and a group:
RUN addgroup -S app && adduser -S app -G app

# Set work directory:
WORKDIR /app

# Expose ports:
EXPOSE 9191
EXPOSE 3000

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Copy and install requirements
COPY ../requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files and entrypoint script:
COPY ../app /app/app
COPY ../scripts/entrypoint.web.sh /app

# Change owner to avoid running code as root:
RUN chown -R app:app /app

# Change current user:
USER app

CMD ["/bin/sh", "/app/entrypoint.web.sh"]
