FROM almalinux:8

ARG NODE_VERSION=17
ARG NPM_VERSION=8.8.0

RUN dnf --setopt=install_weak_deps=False -y module install nodejs:${NODE_VERSION} && \
    npm install --silent --global yarn git curl && \
    npm install -g npm@${NPM_VERSION} && \
    dnf clean all

WORKDIR /app

ENV PATH="/app/node_modules/.bin:${PATH}"

ADD ./entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD [ "node" ]
