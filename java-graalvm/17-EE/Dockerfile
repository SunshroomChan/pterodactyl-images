FROM        container-registry.oracle.com/graalvm/jdk-ee:ol8-java17-22

LABEL       author="SunshroomChan" maintainer="viethoangluunguyen1974@gmail.com"
LABEL       org.opencontainers.image.source="https://github.com/SunshroomChan/pterodactyl-images"
LABEL       org.opencontainers.image.licenses="MIT"

RUN         dnf -y update \
            && dnf -y install \
            curl \
            ca-certificates \
            openssl \
            git \
            tar \
            sqlite \
            fontconfig \
            freetype \
            libstdc++ \
            lsof \
            make \
            gcc \
            gcc-c++ \
            tzdata \
            iproute \
            glibc-langpack-en \
            && dnf clean all \
            && rm -rf /var/cache/dnf \
            && useradd -m -d /home/container container \
            && localedef -i en_US -f UTF-8 en_US.UTF-8

ENV         LC_ALL=en_US.UTF-8
ENV         LANG=en_US.UTF-8
ENV         LANGUAGE=en_US.UTF-8

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/sh", "/entrypoint.sh" ]
