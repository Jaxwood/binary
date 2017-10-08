FROM ubuntu:latest

RUN apt-get update && apt-get install curl -y
RUN mkdir -p /app/repo
# download binary extensions
RUN curl -s https://raw.githubusercontent.com/sindresorhus/binary-extensions/master/binary-extensions.json | sed 's/[],,",\,\t\[]//g' > /app/binaries

COPY . /app
WORKDIR /app