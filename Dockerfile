ARG BASE_IMAGE
FROM ${BASE_IMAGE}

LABEL author="Gregg" maintainer="gregg@largenut.com"
LABEL org.opencontainers.image.source="gitlab.largenut.com"

RUN microdnf update -y && \
microdnf install -y lsof curl ca-certificates openssl git tar sqlite fontconfig freetype tzdata iproute libstdc++ && \
microdnf clean all && \
useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]
