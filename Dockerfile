FROM alpine:3.10
MAINTAINER Nils Sickel <nils.sickel@gmail.com>

RUN apk update && apk upgrade && \
    apk add bash && \
    apk add git && \
    apk add --no-cache --virtual .build-deps g++ python3-dev libffi-dev openssl-dev && \
    apk add --no-cache --update python3 && \
    pip3 install --upgrade pip setuptools

RUN pip3 --no-cache-dir install --upgrade awscli

COPY clone_repos.sh .
COPY repos.txt .

ENTRYPOINT ["/bin/bash", "clone_repos.sh"]
