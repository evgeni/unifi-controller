FROM debian:13

ARG VERSION=10.4.57

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
      apt-get -y dist-upgrade && \
      apt-get install -y --no-install-recommends ca-certificates procps curl openjdk-25-jre-headless && \
      curl -fsSL -o /etc/apt/keyrings/mongodb.asc https://www.mongodb.org/static/pgp/server-8.0.asc && \
      echo "deb [ signed-by=/etc/apt/keyrings/mongodb.asc ] https://repo.mongodb.org/apt/debian bookworm/mongodb-org/8.0 main" > /etc/apt/sources.list.d/mongodb-org.list && \
      apt-get update && \
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
