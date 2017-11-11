#!/bin/sh

exec /usr/bin/java -Declipse.application=org.eclipse.jdt.ls.core.id1 \
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
