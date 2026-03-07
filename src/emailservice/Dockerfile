FROM python:3.12-slim AS base

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

ENV ENABLE_PROFILER=1

WORKDIR /email_server

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip \
    && pip install --no-cache-dir setuptools wheel \
    && pip install --no-cache-dir -r requirements.txt
COPY . .

EXPOSE 8080

ENTRYPOINT ["python", "email_server.py"]