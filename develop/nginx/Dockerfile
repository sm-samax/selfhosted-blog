FROM nginx:1.27.2-alpine

# copy configuration files
COPY ./ghost.conf /etc/nginx/conf.d/
COPY ./php.myadmin.conf /etc/nginx/conf.d/
COPY ./nginx.conf /etc/nginx/nginx.conf

RUN set -ex \
    && rm /etc/nginx/conf.d/default.conf

HEALTHCHECK CMD [ "nginx", "-t" ]