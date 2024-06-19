FROM nginx:1.27.0-alpine3.19

RUN apk update && apk add bash

COPY ./nginx.conf.template /etc/nginx/conf.d/default.conf.template
