FROM docker.io/eclipse-temurin:11-jre-alpine

ENV \
  CMAK_VERSION=3.0.0.6 \
  CMAK_CHECKSUM=3e894572f15a8034d1d4251e7b68155ddc59ce38a8a1b8a21d65140946c219ef

RUN set -x \
  && adduser -u 1000 -D -g 'CMAK User' cmak cmak \
  && apk --no-cache add bash tini \
  && wget -O /tmp/cmak-${CMAK_VERSION}.zip https://github.com/yahoo/CMAK/releases/download/${CMAK_VERSION}/cmak-${CMAK_VERSION}.zip \
  && echo "${CMAK_CHECKSUM}  cmak-${CMAK_VERSION}.zip" > /tmp/CHECKSUM \
  && ( cd /tmp && sha256sum -c CHECKSUM ) \
  && unzip /tmp/cmak-${CMAK_VERSION}.zip \
  && mv cmak-${CMAK_VERSION} cmak \
  && rm -rf /tmp/* \
  && rm /cmak/conf/logger.xml \
  ;

COPY logback.xml /cmak/conf/logback.xml

ENV JAVA_OPTS=-XX:MaxRAMPercentage=80

WORKDIR /cmak
USER cmak

ENTRYPOINT ["tini"]
CMD ["/cmak/bin/cmak", "-Dpidfile.path=/dev/null", "-Dapplication.home=/cmak", ""]
