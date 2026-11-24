# The multi-arch index includes Temurin 21.0.13.1+2 on amd64. ARM64 is unaffected by CVE-2026-114938.
FROM        eclipse-temurin:21-jammy@sha256:b2711c65970c1227197c29c46e669bfdbb137524e9da0e664703a140ec25a040

LABEL       author="SunshroomChan" maintainer="viethoangluunguyen1974@gmail.com"
LABEL       org.opencontainers.image.source="https://github.com/SunshroomChan/pterodactyl-images"
LABEL       org.opencontainers.image.licenses="MIT"

RUN         apt-get update -y \
            && apt-get install -y --no-install-recommends curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 libstdc++6 lsof build-essential tzdata iproute2 locales \
            && apt-get clean \
            && rm -rf /var/lib/apt/lists/* \
            && useradd -m -d /home/container container \
            && locale-gen en_US.UTF-8

ENV         LC_ALL=en_US.UTF-8
ENV         LANG=en_US.UTF-8
ENV         LANGUAGE=en_US.UTF-8

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

RUN         java -version

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/sh", "/entrypoint.sh" ]
