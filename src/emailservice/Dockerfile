FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV ENABLE_PROFILER=1

WORKDIR /email_server

RUN apt-get update && apt-get install -y --no-install-recommends \
    g++ \
    build-essential \
    libssl-dev \
    libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir --force-reinstall "setuptools>=65.0.0"

COPY . .

EXPOSE 8080

ENTRYPOINT ["python", "email_server.py"]