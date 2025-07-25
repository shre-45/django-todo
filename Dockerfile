# Use a stable version of Python (3.10 is safer for Django 3.2)
FROM python:3.10-slim

# Set working directory
WORKDIR /data

# Install pip tools
RUN python -m ensurepip && pip install --upgrade pip setuptools wheel

# Install Django
RUN pip install django==3.2

# Copy project files
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose default Django port
EXPOSE 8000

# Start Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]



