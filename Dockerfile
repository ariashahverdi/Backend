FROM python:3.7.0-alpine

LABEL maintainer "Aria Shahverdi"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
        gcc libc-dev linux-headers postgresql-dev
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

CMD python3 manage.py runserver 0.0.0.0:$PORT

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user


