FROM        container-registry.oracle.com/graalvm/jdk-ee:ol9-java17-21.3.14

LABEL       author="SunshroomChan" maintainer="viethoangluunguyen1974@gmail.com"
LABEL       org.opencontainers.image.source="https://github.com/SunshroomChan/pterodactyl-images"
LABEL       org.opencontainers.image.licenses="MIT"

RUN         microdnf update \
            && microdnf install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute gcc gcc-c++ freetype libstdc++ lsof glibc-locale-source glibc-langpack-en \
            && microdnf clean all \
            && adduser --home-dir /home/container container

ENV         LC_ALL=en_US.UTF-8
ENV         LANG=en_US.UTF-8
ENV         LANGUAGE=en_US.UTF-8

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/sh", "/entrypoint.sh" ]
