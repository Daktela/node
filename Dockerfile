FROM node:16.15.0-alpine3.15

RUN apk update && apk add --no-cahe ncdu git curl

WORKDIR /app

ADD ./entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


CMD [ "node" ]
