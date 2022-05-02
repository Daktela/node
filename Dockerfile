FROM almalinux:8

RUN dnf module list && \
    dnf -y module install nodejs:16 && \
    npm install yarn && \
    dnf clean all

CMD [ "node" ]
