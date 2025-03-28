FROM python:3.9-slim-buster

# Install necessary system dependencies
RUN apt update -y && apt install -y \
    awscli \
    gcc \
    libc-dev \
    python3-dev

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Upgrade pip, setuptools, and wheel
RUN pip install --upgrade pip setuptools wheel

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Command to run the application
CMD ["python", "app.py"]
