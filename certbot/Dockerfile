FROM ubuntu:22.04

ARG DOMAIN_EMAIL
ARG DOMAIN
ARG API_DOMAIN

ENV DOMAIN_EMAIL=$DOMAIN_EMAIL
ENV DOMAIN=$DOMAIN
ENV API_DOMAIN=$API_DOMAIN

WORKDIR /certbot
COPY . /certbot

RUN apt-get update && apt-get -y install certbot
