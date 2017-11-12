FROM openjdk:8-jdk-alpine

ARG eclipse_jdt_version=v0.8.0
ENV ECLIPSE_JDT_VERSION $eclipse_jdt_version

RUN apk add --no-cache \
	git \
	maven \
	tini \
	su-exec \
	&& git clone https://github.com/eclipse/eclipse.jdt.ls.git /eclipse \
	&& cd /eclipse \
	&& git checkout $ECLIPSE_JDT_VERSION \
	&& mvn clean verify -Dmaven.test.skip=true \
	&& rm -rf /root/.m2 \
	&& mkdir /workspace_storage

VOLUME /workspace_storage

COPY start.sh /

ENTRYPOINT ["/sbin/tini", "--"]

CMD [ "/start.sh" ]

