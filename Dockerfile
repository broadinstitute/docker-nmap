FROM alpine:3.11

RUN apk update \
    && apk add autoconf automake bash g++ gcc git libssh2-dev linux-headers make musl-dev openssl-dev \
    && cd /tmp \
    && git clone --depth 1 --branch master https://github.com/nmap/nmap.git \
    && cd /tmp/nmap \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*
