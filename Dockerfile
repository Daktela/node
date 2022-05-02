FROM almalinux:8

# Install yarn
RUN dnf module list && \
    dnf -y module install nodejs:16 && \
    dnf install yarn && \
    dnf clean all

CMD [ "node" ]
