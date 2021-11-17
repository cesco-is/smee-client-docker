FROM alpine:3.14.3

LABEL maintainer "melong0124@me.com"

RUN apk add --update bash nodejs npm \
    && npm install --global smee-client@1.1.0

ADD docker-entrypoint.sh /

CMD [ "bash", "/docker-entrypoint.sh"]