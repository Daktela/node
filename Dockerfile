FROM almalinux:8

# Install yarn
RUN dnf module list && \
    dnf -y module install nodejs:16 && \
    dnf clean all

CMD [ "node" ]
