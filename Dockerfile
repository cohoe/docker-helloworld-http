FROM debian:jessie

LABEL maintainer "opsxcq@strm.sh"

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY server.py /
COPY main.sh /
RUN mkdir -m 0775 /www

EXPOSE 8080

WORKDIR /www

USER 1001
ENTRYPOINT ["/main.sh"]

