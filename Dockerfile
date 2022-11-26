FROM alpine:latest

ARG NODE_VERSION=16.15.0

RUN apk add "nodejs=$NODE_VERSION" npm yarn ncdu git curl

WORKDIR /app

ADD ./entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


CMD [ "node" ]
