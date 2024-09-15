FROM ubuntu:20.04

ARG VERSION=8.4.62

ENV DEBIAN_FRONTEND=noninteractive

RUN (for distribution in focal focal-updates focal-security; do echo deb http://archive.ubuntu.com/ubuntu/ ${distribution} main universe; done;) > /etc/apt/sources.list && \
      apt-get update && \
      apt-get -y dist-upgrade && \
      apt-get install -y --no-install-recommends ca-certificates procps curl openjdk-17-jre-headless && \
      curl -sSL https://dl.ui.com/unifi/${VERSION}/unifi_sysvinit_all.deb -o /tmp/unifi-${VERSION}.deb && \
      apt-get install -y --no-install-recommends /tmp/unifi-${VERSION}.deb && \
      apt-get clean && \
      rm -rf /tmp/* && \
      ln -s /var/lib/unifi /usr/lib/unifi/data && \
      ln -s /var/log/unifi /usr/lib/unifi/logs && \
      ln -s /var/run/unifi /usr/lib/unifi/run

EXPOSE 3478/udp 6789/tcp 8080/tcp 8443/tcp 8843/tcp 8880/tcp 10001/udp

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
USER unifi
VOLUME ["/var/lib/unifi", "/var/log/unifi"]
WORKDIR /usr/lib/unifi
