FROM        amazoncorretto:8-al2023-jdk

LABEL       author="SunshroomChan" maintainer="viethoangluunguyen1974@gmail.com"
LABEL       org.opencontainers.image.source="https://github.com/SunshroomChan/pterodactyl-images"
LABEL       org.opencontainers.image.licenses="MIT"

RUN         dnf upgrade -y \
            && dnf install -y --allowerasing curl ca-certificates openssl git tar sqlite fontconfig freetype \
            libstdc++ freetype-devel lsof tzdata iproute gcc gcc-c++ automake make libtool shadow-utils glibc-langpack-en \
            && dnf clean all \
            && rm -rf /var/cache/dnf \
            && useradd -m -d /home/container container

ENV         LC_ALL=en_US.UTF-8
ENV         LANG=en_US.UTF-8
ENV         LANGUAGE=en_US.UTF-8

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/sh", "/entrypoint.sh" ]
