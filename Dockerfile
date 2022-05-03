FROM almalinux:8

ARG NODE_VERSION=17.9.0

RUN dnf -y install git curl && \
    dnf clean all

ENV NVM_DIR /usr/bin/nvm
ENV PATH="$NVM_DIR/versions/node/v$NODE_VERSION/bin/:/app/node_modules/.bin:${PATH}"
RUN mkdir -p $NVM_DIR

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

RUN npm install --silent --global yarn

WORKDIR /app

ADD ./entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


CMD [ "node" ]
