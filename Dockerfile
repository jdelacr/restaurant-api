FROM python:3.9.7-alpine
LABEL Jan Justyn Dela Cruz

ENV PYTHONUNBUFFERED=1

RUN apk update

COPY ./requirement.txt /requirement.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirement.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user