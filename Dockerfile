FROM python:3.7-alpine
MAINTAINER Kevin Maingi

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# -D used simply to run processes from the project
RUN adduser -D user
# this is done for security, limit the scope for an attacker within the container
USER user
