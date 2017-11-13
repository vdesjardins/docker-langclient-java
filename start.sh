#!/bin/sh

if [[ "${EUID}" == "" || "${EGID}" == "" ]]; then
    echo "Environment variable EUID and EGID must be set"
    exit 1
fi

addgroup -g ${EGID} dev
adduser -u ${EUID} -s /bin/bash -D -G dev dev

chown -R dev:dev /workspace_storage
chown -R dev:dev /eclipse

su-exec dev:dev /usr/bin/java -Declipse.application=org.eclipse.jdt.ls.core.id1 \
     -Dosgi.bundles.defaultStartLevel=4 \
     -Declipse.product=org.eclipse.jdt.ls.core.product \
     -noverify \
     -Xmx1G \
     -XX:+UseG1GC \
     -XX:+UseStringDeduplication \
     -Xdebug \
     -Dosgi.noShutdown=true \
     -jar /eclipse/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar \
     -configuration /eclipse/org.eclipse.jdt.ls.product/target/repository/config_linux \
     -data /workspace_storage
