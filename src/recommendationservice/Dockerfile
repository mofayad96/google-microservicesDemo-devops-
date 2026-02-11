# Base image
FROM python:3.12-slim AS base

# Builder stage
FROM base AS builder

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install build tools on Debian-based image
RUN apt-get update && apt-get install -y \
    g++ \
    build-essential \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy and install Python packages
COPY requirements.txt .
# Ensure setuptools and wheel are installed
RUN pip install --upgrade pip setuptools wheel \
    && pip install --no-cache-dir -r requirements.txt

# Final stage
FROM base

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install runtime dependencies
RUN apt-get update && apt-get install -y \
    libstdc++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /recommendationservice

# Copy installed packages from builder
COPY --from=builder /usr/local/lib/python3.12/ /usr/local/lib/python3.12/

# Copy application code
COPY . .

# Set listen port
ENV PORT="8080"
EXPOSE 8080

ENTRYPOINT ["python", "recommendation_server.py"]
