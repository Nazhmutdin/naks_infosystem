FROM ubuntu:22.04

ARG DOMAIN_EMAIL
ARG DOMAIN
ARG API_DOMAIN

ENV DOMAIN_EMAIL=$DOMAIN_EMAIL
ENV DOMAIN_URL=$DOMAIN
ENV API_DOMAIN=$API_DOMAIN

WORKDIR /certbot
COPY . /certbot
WORKDIR /certbot

RUN apt-get update
RUN apt-get -y install certbot

CMD ["sh", "generate_ssl_certificates.sh"]
