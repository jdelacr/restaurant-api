FROM python:3.9.7-alpine
LABEL Jan Justyn Dela Cruz

ENV PYTHONUNBUFFERED=1

COPY ./requirement.txt /requirement.txt
RUN pip install -r /requirement.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user