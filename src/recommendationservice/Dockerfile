# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM --platform=$BUILDPLATFORM python:3.12.12-alpine AS base

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Builder stage
FROM base AS builder
RUN apk add --no-cache g++ linux-headers libffi-dev make

WORKDIR /build
COPY requirements.txt .

# Install packages into /install
RUN pip install --prefix=/install -r requirements.txt

# Final stage
FROM base

WORKDIR /recommendationservice

# System dependencies
RUN apk add --no-cache libstdc++ libffi

# Copy installed packages
COPY --from=builder /install /usr/local

# Copy application code
COPY . .

# Environment & port
ENV PORT=8080
EXPOSE 8080

ENTRYPOINT ["python", "recommendation_server.py"]
