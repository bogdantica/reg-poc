FROM python:3.10.4-alpine3.16

RUN apk update
RUN apk add bash
RUN apk add git
SHELL ["/bin/bash", "-c"]

WORKDIR /server

RUN git clone -b development https://github.com/GLEIF-IT/reg-poc-server.git .

RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /server/src/regps

ENTRYPOINT [ "celery", "-A", "app.tasks", "worker", "--loglevel=debug" ]