FROM adoptopenjdk:14-jre-hotspot
ARG DEPENDENCY=target/dependency
ARG user=afx
ARG group=discovery
ARG uid=1000
ARG gid=1000
RUN groupadd -g ${gid} ${group} && useradd -u ${uid} -g ${group} -s /bin/sh ${user}
USER ${user}:${group}
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.afx.discovery.DiscoveryApplication"]