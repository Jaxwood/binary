FROM ubuntu:latest

RUN apt-get update && apt-get install curl -y

COPY . /app
WORKDIR /app
