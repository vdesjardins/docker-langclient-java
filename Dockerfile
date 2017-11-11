FROM openjdk:8-jdk-alpine

RUN apk add --no-cache \
       git \
       maven \
       tini \
    && git clone https://github.com/eclipse/eclipse.jdt.ls.git /eclipse \
    && cd /eclipse \
    && mvn clean verify \
    && rm -rf /root/.m2 \
    && mkdir /workspace_storage

VOLUME /workspace_storage

COPY start.sh /

ENTRYPOINT ["/sbin/tini", "--"]

CMD [ "/start.sh" ]

