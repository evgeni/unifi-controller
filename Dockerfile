FROM ubuntu:20.04

ARG VERSION=6.0.45

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates procps curl openjdk-8-jre-headless && apt-get clean

RUN apt-get update && curl -sSL https://dl.ui.com/unifi/${VERSION}/unifi_sysvinit_all.deb -o /tmp/unifi-${VERSION}.deb && apt-get install -y --no-install-recommends /tmp/unifi-${VERSION}.deb && apt-get clean

RUN ln -s /var/lib/unifi /usr/lib/unifi/data && ln -s /var/log/unifi /usr/lib/unifi/logs && ln -s /var/run/unifi /usr/lib/unifi/run

EXPOSE 3478/udp 6789/tcp 8080/tcp 8443/tcp 8843/tcp 8880/tcp 10001/udp

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
USER unifi
WORKDIR /usr/lib/unifi
