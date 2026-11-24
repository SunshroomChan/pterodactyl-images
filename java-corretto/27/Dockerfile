FROM        amazoncorretto:27@sha256:7ea74bb42ee0f34bfd69052476a3e7f27d152d1f5b3bff966cde2c890f6e994a

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

RUN         java -version

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/sh", "/entrypoint.sh" ]
