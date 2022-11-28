FROM node:19-alpine3.15

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache ncdu git curl

WORKDIR /app

ADD ./entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


CMD [ "node" ]
