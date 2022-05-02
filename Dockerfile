FROM almalinux:8

ARG NODE_VERSION=16

RUN dnf update && \
    dnf -y module install nodejs:${NODE_VERSION} && \
    npm install --silent --global yarn && \
    dnf clean all

CMD [ "node" ]
