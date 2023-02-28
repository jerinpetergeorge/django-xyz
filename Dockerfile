FROM python:3.10-slim-buster as base

LABEL maintainer="Jerin Peter George <jerinpetergeorge@gmail.com>"

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Create and set work directory called `app`
RUN mkdir -p /app
WORKDIR /app

# Copy local project
COPY . /app/

# Installing pip packages
RUN pip install pip -U

FROM base as dev
RUN pip install -r requirements/compiled/dev.txt -U

FROM base AS prod
RUN pip install -r requirements/compiled/production.txt -U
