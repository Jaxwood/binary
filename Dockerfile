FROM ubuntu:latest

RUN apt-get update && apt-get install curl -y
RUN mkdir -p /app/repo

COPY run.sh /app
WORKDIR /app