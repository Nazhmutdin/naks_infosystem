FROM nginx:1.27.0-alpine3.19

RUN apk update && apk add bash
RUN rm -fr /etc/nginx/sites-available && mkdir /etc/nginx/sites-available
RUN mkdir /etc/nginx/sites-enabled

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./nginx.conf.template /etc/nginx/conf.d/default.conf.template
